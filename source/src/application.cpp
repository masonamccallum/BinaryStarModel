#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <fstream>
#include <sstream>
#include <array>
#include "Shader.h"
#include "Renderer.h"
#include "VertexBuffer.h"
#include "IndexBuffer.h"
#include "VertexArray.h"
#include "../src/vendor/glm/glm.hpp"
#include "../src/vendor/glm/gtc/matrix_transform.hpp"
#include "../src/vendor/glm/gtx/string_cast.hpp"
#include "Camera.h"
#include "../src/vendor/imgui/imgui.h"
#include "../src/vendor/imgui/imgui_impl_glfw.h"
#include "../src/vendor/imgui/imgui_impl_opengl3.h"

void processInput(GLFWwindow *window);
// camera
Camera camera(glm::vec3(70.0f, 30.0f, 260.0f));
// timing
float deltaTime = 0.0f;	
float lastFrame = 0.0f;
// window size
extern const int width = 1600;
extern const int height = 1000;
static const int numRowCol = 30;
static const float gridSquareSize = 5.0f;

int main(void){
	GLFWwindow* window;
    glfwInit();
    window = glfwCreateWindow(width,height,"learn GLFW",NULL, NULL);
    glfwMakeContextCurrent(window);
	glfwSwapInterval(1);
	glewInit();
    glfwSetInputMode(window, GLFW_RAW_MOUSE_MOTION, GLFW_TRUE);

	glm::mat4 proj;
	proj = glm::perspective(glm::radians(45.0f), (float)width/(float)height, 0.1f, 400.0f);
	glm::mat4 view = camera.GetViewMatrix();
	glm::mat4 model = glm::mat4(1.0f);//glm::rotate(glm::mat4(1.0f), glm::radians(-100.0f), glm::vec3(1.0f,0.0f,0.0f));
	glm::mat4 mvp = proj * view * model;

    float positions[] = {
		5.0f, 0.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		0.0f, 0.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		0.0f, 0.0f, 5.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		5.0f, 0.0f, 5.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,

		20.0f, 20.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		10.0f, 20.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		10.0f, 10.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		20.0f, 10.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f
	};
	unsigned int indices[] = {
	0,1,2,2,3,0,
	4,5,6,6,7,4
	};
		
	VertexArray va;
	VertexBuffer vb(8);
	VertexBufferLayout layout;
	layout.Push<float>(4);
	layout.Push<float>(4);
	va.AddBuffer(vb, layout);
	IndexBuffer ib(indices, 12);
	Shader shader("../res/shaders/Basic.shader");

	float grid_verts[4*4*(numRowCol + 1)]; // WARNING: 4 hard codes the layout of each vertex
	unsigned int grid_idx[4*(numRowCol+1)];

	float pointOne[4];
	float pointTwo[4];
	float leftGrid = 0.0f;
	float rightGrid = numRowCol * gridSquareSize; 
	float bottomGrid = 0.0f;
	float topGrid = numRowCol * gridSquareSize; 
	
	int idx = 0;
	//Horizontal
	for(int i=0; i < numRowCol + 1; i++){
		pointOne[0] = leftGrid ; pointOne[1] = 0.0f; pointOne[2] = i*gridSquareSize; pointOne[3] = 1.0f;
		pointTwo[0] = rightGrid; pointTwo[1] = 0.0f; pointTwo[2] = i*gridSquareSize; pointTwo[3] = 1.0f;
		std::cout << pointOne[0] << ","<< pointOne[1] << ","<< pointOne[2] << ","<< pointOne[3] << " | ";
		std::cout << pointTwo[0] << ","<< pointTwo[1] << ","<< pointTwo[2] << ","<< pointTwo[3] << std::endl;
		for(int k=0; k<4; k++)	{
			grid_verts[idx*4+k] = pointOne[k];
			grid_verts[(idx+1)*4+k] = pointTwo[k];
		}
		idx+=2;
	}
	//Vertical
	for(int i=0; i < numRowCol + 1; i++){
		pointOne[0] = i*gridSquareSize; pointOne[1] = 0.0f; pointOne[2] = bottomGrid; pointOne[3] = 1.0f;
		pointTwo[0] = i*gridSquareSize; pointTwo[1] = 0.0f; pointTwo[2] = topGrid; pointTwo[3] = 1.0f;
		for(int k=0; k<4; k++)	{
			grid_verts[idx*4+k] = pointOne[k];
			grid_verts[(idx+1)*4+k] = pointTwo[k];
		}
		idx+=2;
	}

	for(unsigned int i=0; i<4*(numRowCol+1); i++){
		grid_idx[i] = i;
	}
	std::cout << "++++" << std::endl;
	std::cout << "check two" << std::endl;
	for(int i = 0; i < 4*20; i+=4){
	std::cout << grid_verts[i+0] << ","<< grid_verts[i+1] << ","<< grid_verts[i+2] << ","<< grid_verts[i+3] << std::endl;
	}
	std::cout << "++++" << std::endl;
	
	std::cout << "size ";
	std::cout << sizeof(grid_verts)/(sizeof(grid_verts[0])*4) << std::endl;
	



	float grid_vertices[]={
		50.0f, 0.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		0.0f, 0.0f, 0.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		0.0f, 0.0f, 50.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		50.0f, 0.0f, 50.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
		70.0f, 0.0f, 20.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f
	};
	unsigned int grid_index[]={
		0,1,2,3,0,4
	};

	VertexArray grid_va;
	//VertexBuffer grid_vb(5);
	VertexBuffer grid_vb(4*(numRowCol+1));
	VertexBufferLayout grid_layout;
	grid_layout.Push<float>(4);
	//grid_layout.Push<float>(4);
	grid_va.AddBuffer(grid_vb, grid_layout);
	IndexBuffer grid_ib(grid_idx, 4*(numRowCol+1));
	Shader grid_shader("../res/shaders/grid.shader");
	grid_shader.Bind();
	grid_shader.SetUniformMat4f("u_MVP", mvp);

	Renderer renderer;	
	ImGui::CreateContext();
	ImGui::StyleColorsDark();
	ImGui_ImplGlfw_InitForOpenGL(window, true);
	const char* glsl_version = "#version 330";
	ImGui_ImplOpenGL3_Init(glsl_version);
	bool show_demo_window = false;
   	bool show_another_window = false;
   	ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
	
    while(!glfwWindowShouldClose(window)){
        float currentFrame = glfwGetTime();
        deltaTime = currentFrame - lastFrame;
        lastFrame = currentFrame;

		renderer.Clear();
		ImGui_ImplOpenGL3_NewFrame();
		ImGui_ImplGlfw_NewFrame();
		ImGui::NewFrame();
		processInput(window);

		grid_shader.Bind();
		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;
		grid_shader.SetUniformMat4f("u_MVP", mvp);

		//vb.Update(positions);
		//grid_vb.Update(grid_vertices);
		grid_vb.Update(grid_verts);
		//renderer.Draw(va,ib,shader,GL_POINTS);
		//renderer.Draw(va,ib,shader, GL_TRIANGLES);
		//renderer.Draw(va,ib,shader, GL_LINES);
		//renderer.Draw(va,ib,shader, GL_LINE_STRIP);
		renderer.Draw(grid_va,grid_ib, grid_shader, GL_LINES);

		if (show_demo_window)
            ImGui::ShowDemoWindow(&show_demo_window);
        {
            static float f = 0.0f;
            static int counter = 0;
            ImGui::Text("Camera Position: X:%.3f, Y:%.3f, Z:%.3f", camera.Position.x,camera.Position.y,camera.Position.z);               // Display some text (you can use a format strings too)
            ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
        }
		
		ImGui::Render();
		ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());		
      	glfwSwapBuffers(window);
		glfwPollEvents();
    }
	ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplGlfw_Shutdown();
    ImGui::DestroyContext();
	glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}

void processInput(GLFWwindow *window){
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
    if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
        camera.ProcessKeyboard(FORWARD, deltaTime);
    if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
        camera.ProcessKeyboard(BACKWARD, deltaTime);
    if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
        camera.ProcessKeyboard(LEFT, deltaTime);
    if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
        camera.ProcessKeyboard(RIGHT, deltaTime);
}