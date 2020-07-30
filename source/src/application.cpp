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
#include "Grid.h"
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
		
	Renderer renderer;	
	
	Grid grid(5.0f, mvp);

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

		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;

		grid.Update(mvp);	
		renderer.Draw(grid);


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