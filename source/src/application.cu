#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <cuda.h>
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
#define DT 0.005
#define G 1.0
#define STOP_TIME 1.0
#define DAMP 1.0
#define H 1.0

float4 p[N];
float3 v[N], f[N];
float4 * p_GPU;
float3 * v_GPU,* f_GPU;
dim3 block; 
dim3 gridCUDA;


void set_initail_conditions(){
	int i,j,k,num,particles_per_side;
    float position_start, temp;
    float initail_seperation;

	temp = pow((float)N,1.0/3.0) + 0.99999;
	particles_per_side = temp;
	printf("\n cube root of N = %d \n", particles_per_side);
    position_start = -(particles_per_side -1.0)/2.0;
	initail_seperation = 1.0;
	
	for(i=0; i<N; i++)
	{
		p[i].w = 1.0;
	}
	
	num = 0;
	for(i=0; i<particles_per_side; i++)
	{
		for(j=0; j<particles_per_side; j++)
		{
			for(k=0; k<particles_per_side; k++)
			{
			    if(N <= num) break;
				p[num].x = position_start + i*initail_seperation;
				p[num].y = position_start + j*initail_seperation;
				p[num].z = position_start + k*initail_seperation;
				v[num].x = 0.0;
				v[num].y = 0.0;
				v[num].z = 0.0;
				num++;
			}
		}
	}
	
	block.x = BLOCK;
	block.y = 1;
	block.z = 1;
	
	gridCUDA.x = (N-1)/block.x + 1;
	gridCUDA.y = 1;
	gridCUDA.z = 1;
	
	cudaMalloc( (void**)&p_GPU, N * sizeof(float4) );
	cudaMalloc( (void**)&v_GPU, N * sizeof(float3) );
	cudaMalloc( (void**)&f_GPU, N * sizeof(float3) );
}
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

void mouse_callback(GLFWwindow*, double, double);
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


int main(void){

{
	float dt;
	float time = 0.0;
	float elapsedTime;	

	block.x = BLOCK;
	block.y = 1;
	block.z = 1;
	
	gridCUDA.x = (N-1)/block.x + 1;
	gridCUDA.y = 1;
	gridCUDA.z = 1;

	cudaEvent_t start, stop;
	cudaEventCreate(&start);
	cudaEventCreate(&stop);
	cudaEventRecord(start, 0);
	
	dt = DT;
    cudaMemcpy( p_GPU, p, N * sizeof(float4), cudaMemcpyHostToDevice );
    cudaMemcpy( v_GPU, v, N * sizeof(float3), cudaMemcpyHostToDevice );
    
	while(time < STOP_TIME){	
		cudaSetDevice(0);
		getForces<<<gridCUDA, block>>>(p_GPU, v_GPU, f_GPU);
		moveBodies<<<gridCUDA, block>>>(p_GPU, v_GPU, f_GPU);
		cudaMemcpy(p , p_GPU, N * sizeof(float4), cudaMemcpyDeviceToHost);
		cudaDeviceSynchronize();
		time += dt;
	}
	
	cudaEventRecord(stop, 0);
	cudaEventSynchronize(stop);
	cudaEventElapsedTime(&elapsedTime, start, stop);
	printf("\n\nGPU time = %3.1f milliseconds\n", elapsedTime);
}
	Window window(width, height, mouse_callback);

	glm::mat4 proj;
	proj = glm::perspective(glm::radians(45.0f), (float)width/(float)height, 0.1f, 400.0f);
	glm::mat4 view = camera.GetViewMatrix();
	glm::mat4 model = glm::mat4(1.0f);//glm::rotate(glm::mat4(1.0f), glm::radians(-100.0f), glm::vec3(1.0f,0.0f,0.0f));
	glm::mat4 mvp = proj * view * model;
	Renderer renderer;	
	Grid grid(5.0f, mvp);
	GUI gui(window.ptr);
	set_initail_conditions();

	
	//////////////////////////////////////////////////	
	//          CUDA INTEROP                        //
	//////////////////////////////////////////////////	
	VertexArray va;
	//float particles[N*4];
	//unsigned int index[N];

	//for(unsigned int i = 0; i < N; i++){
	//	index[i] = i;
	//}

	//for(int i = 0; i < 10; i++){
	//	for(int j = 0; j < 10; j++){
	//		for(int k = 0; k < 10; k++){
	//		}
	//	}
	//}
	
	float particles[16] = {
		0.0f,0.0f,0.0f,1.0f,
		10.0f,10.0f,10.0f,1.0f,
		10.0f,0.0f,100.0f,1.0f,
		0.0f,10.0f,0.0f,1.0f,
	};
	
	unsigned int index[4] = {
		0,1,2,3		
	};

	//for(int i=0; i < 20; i+=4){
	//	std::cout << "(" <<particles[i+0]<< "," <<particles[i+1]<< "," <<particles[i+2] << "," <<particles[i+3] << ")" << std::endl;
	//}
	
	VertexBuffer vb(4);
	VertexBufferLayout layout;		
	layout.Push<float>(4);
	va.AddBuffer(vb, layout);
	IndexBuffer ib(index, 4);//1000);
	Shader shader("../res/shaders/particle.shader");
	
	//cudaGraphicsResource * resourceA;
	//VertexBuffer vb(100, true);
	//cudaSetDevice(cutGetMaxGflopsDeviceId());
	//cudaGLSetGLDevice(cutGetMaxGflopsDeviceId());
	//cudaGraphicsGLRegisterBuffer(...);
	//cudaStream_t cuda_Stream;
	//cudaStreamCreate(&cuda_Stream);
	//cudaGraphicsMapResources(1, resource, cuda_Stream);
	//cudaGraphicsUnmapResources(1, resource, cuda_Stream);
	//cudaStreamDestroy(cuda_Stream);
	
    while(!window.shouldClose()){
        float currentFrame = glfwGetTime();
        deltaTime = currentFrame - lastFrame;
		lastFrame = currentFrame;
		renderer.Clear();
		gui.NewFrame();
		Input::processInput(window.ptr, camera, deltaTime);

		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;
		//mvp = glm::mat4(1.0f);
		
		///////////////////////////////////////////
		//            CUDA INTEROP               //
		///////////////////////////////////////////
		

		shader.Bind();
		ib.Bind();
		shader.SetUniformMat4f("u_MVP", mvp);
		vb.Update(particles);
		renderer.Draw(va,ib,shader, GL_POINTS);
		///////////////////////////////////////////
		

		grid.Update(mvp);	
		renderer.Draw(grid);

		gui.CameraWindowUpdate(camera);
		gui.Render();
		window.Update();
    }
    return 0;
}

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