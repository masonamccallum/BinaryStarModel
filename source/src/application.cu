#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <unistd.h>
#include <cuda_gl_interop.h>
#include "graphicsIncludes.h"
#include "vendorIncludes.h"
#include "Renderer.h"
#include "Grid.h"
#include "Camera.h"
#include "Input.h"
#include "GUI.h"
#include "Window.h"

//CUDA
#define N 1024 
#define BLOCK 256
#define DT 0.0005
#define G 1.0
#define DAMP 1.0
#define H 0.00001

__device__ float3 getBodyBodyForce(float4 p0, float4 p1)
{
    float3 f;
    float dx = p1.x - p0.x;
    float dy = p1.y - p0.y;
    float dz = p1.z - p0.z;
    float r2 = dx*dx + dy*dy + dz*dz;
    float r = sqrt(r2);
    
    float force  = (G*p0.w*p1.w)/(r2) - (H*p0.w*p1.w)/(r2*r2);
    
    f.x = force*dx/r;
    f.y = force*dy/r;
    f.z = force*dz/r;
    
    return(f);
}

__global__ void getForces(float4 *pos, float3 *vel, float3 * force){
	int j,ii;
    float3 force_mag, forceSum;
    float4 posMe;
    __shared__ float4 shPos[BLOCK];
    int id = threadIdx.x + blockDim.x*blockIdx.x;
    
    forceSum.x = 0.0;
	forceSum.y = 0.0;
	forceSum.z = 0.0;
		
	posMe.x = pos[id].x;
	posMe.y = pos[id].y;
	posMe.z = pos[id].z;
	posMe.w = pos[id].w;
	    
    for(j=0; j < gridDim.x; j++){
    	shPos[threadIdx.x] = pos[threadIdx.x + blockDim.x*j];
    	__syncthreads();
   
		#pragma unroll 32
        for(int i=0; i < blockDim.x; i++){
        	ii = i + blockDim.x*j;
		    if(ii != id && ii < N){
		    	force_mag = getBodyBodyForce(posMe, shPos[i]);
			    forceSum.x += force_mag.x;
			    forceSum.y += force_mag.y;
			    forceSum.z += force_mag.z;
		    }
	   	 }
	}
	if(id < N){
	    force[id].x = forceSum.x;
	    force[id].y = forceSum.y;
	    force[id].z = forceSum.z;
    }
}
__global__ void moveBodies(float4* pos, float3* vel, float3* force)
{
    int id = threadIdx.x + blockDim.x*blockIdx.x;
	    vel[id].x += ((force[id].x-DAMP*vel[id].x)/pos[id].w)*DT;
	    vel[id].y += ((force[id].y-DAMP*vel[id].y)/pos[id].w)*DT;
	    vel[id].z += ((force[id].z-DAMP*vel[id].z)/pos[id].w)*DT;
	
	    pos[id].x += vel[id].x*DT;
	    pos[id].y += vel[id].y*DT;
	    pos[id].z += vel[id].z*DT;
}

// camera
Camera camera(glm::vec3(70.0f, 30.0f, 260.0f));
// timing
float deltaTime = 0.0f;	
float lastFrame = 0.0f;
const int width = 1600;
const int height = 1000;
float lastX = width/2.0f;
float lastY = height/2.0f;
bool firstMouse= true;

void mouse_callback(GLFWwindow* window, double xpos, double ypos){
    if (firstMouse){
        lastX = xpos;
        lastY = ypos;
        firstMouse = false;
    }

    float xoffset = xpos - lastX;
    float yoffset = lastY - ypos; // reversed since y-coordinates go from bottom to top
    lastX = xpos;
    lastY = ypos;

    camera.ProcessMouseMovement(xoffset, yoffset);
}


int main(void){
	Window window(width, height, mouse_callback);

	glm::mat4 proj;
	proj = glm::perspective(glm::radians(45.0f), (float)width/(float)height, 0.1f, 400.0f);
	glm::mat4 view = camera.GetViewMatrix();
	glm::mat4 model = glm::mat4(1.0f);//glm::rotate(glm::mat4(1.0f), glm::radians(-100.0f), glm::vec3(1.0f,0.0f,0.0f));
	glm::mat4 mvp = proj * view * model;
	Renderer renderer;	
	Grid grid(5.0f, mvp);
	GUI gui(window.ptr);
	//set_initail_conditions();

	
	//////////////////////////////////////////////////	
	//          CUDA INTEROP                        //
	//////////////////////////////////////////////////	
	float particles_CPU[N*4];
	
	unsigned int index[N];

	for(unsigned int i = 0; i < N; i++){
		index[i] = i;
	}
	
	float point[4];
	int idx = 0;
	for(int i = 0; i < 10; i++){
		for(int j = 0; j < 10; j++){
			for(int k = 0; k < 10; k++){
				point[0] = i * 10; point[1] = j * 10; point[2] = k * 10; point[3] = 1.0f;
				for(int m =0; m < 4; m++){
					particles_CPU[idx*4 + m] = point[m];
				}
				idx++;
			}
		}
	}
	
	VertexArray va;
	VertexBuffer vb(1024);
	VertexBufferLayout layout;		
	layout.Push<float>(4);
	va.AddBuffer(vb, layout);
	IndexBuffer ib(index, 1000);
	Shader shader("../res/shaders/particle.shader");
	
	float vel_CPU[N*3] = {0};
	float force_CPU[N*3] = {0};
	float4* posGPU;
	float3 *velGPU, *forceGPU;
	cudaMalloc((void**)&posGPU, 1024*sizeof(float4));
	cudaMalloc((void**)&velGPU, 1024*sizeof(float3));
	cudaMalloc((void**)&forceGPU, 1024*sizeof(float3));
	cudaMemcpy(forceGPU, force_CPU, 1024*sizeof(float3), cudaMemcpyHostToDevice);
	cudaMemcpy(velGPU,vel_CPU, 1024*sizeof(float3), cudaMemcpyHostToDevice);
	
    while(!window.shouldClose()){
        float currentFrame = glfwGetTime();
        deltaTime = currentFrame - lastFrame;
		lastFrame = currentFrame;
		renderer.Clear();
		gui.NewFrame();
		Input::processInput(window.ptr, camera, deltaTime);

		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;

		
		cudaMemcpy(posGPU, particles_CPU, 1024*sizeof(float4), cudaMemcpyHostToDevice);
		getForces<<<1024, 1>>>(posGPU, velGPU, forceGPU);
		moveBodies<<<1024, 1>>>(posGPU, velGPU, forceGPU);
		cudaMemcpy(particles_CPU, posGPU, 1024*sizeof(float4), cudaMemcpyDeviceToHost);

		vb.Update(particles_CPU);
		ib.Bind();
		shader.Bind();
		shader.SetUniformMat4f("u_MVP", mvp);
		renderer.Draw(va,ib,shader,GL_POINTS);
		
		grid.Update(mvp);	
		renderer.Draw(grid);

		gui.CameraWindowUpdate(camera);
		gui.Render();
		window.Update();
    }
    return 0;
}