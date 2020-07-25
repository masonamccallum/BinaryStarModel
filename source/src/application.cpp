#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <fstream>
#include <sstream>

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
Camera camera(glm::vec3(0.0f, 0.0f, 30.0f));

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

    
    float positions[] = {
			0.0f, 0.0f, 10.0f, 10.0f, 0.18f, 0.6f, 0.96f, 1.0f,
			1.0f, 10.0f, 50.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
			15.0f, 20.0f, 50.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,
			14.0f, 20.0f, 50.0f, 1.0f, 0.18f, 0.6f, 0.96f, 1.0f,

			-10.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.93f, 0.24f, 1.0f,
			-20.0f, 7.0f, 1.0f, 1.0f, 1.0f, 0.93f, 0.24f, 1.0f,
			-10.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.93f, 0.24f, 1.0f,
			-10.0f, -15.0f, 0.0f, 1.0f, 1.0f, 0.93f, 0.24f, 1.0f
    };
	
		unsigned int indices[] = {
		0,1,2,2,3,0,
		4,5,6,6,7,4
		};
		
		VertexArray va;
		VertexBuffer vb(positions, 8*8*sizeof(float));
    
		VertexBufferLayout layout;
		layout.Push<float>(4);
		layout.Push<float>(4);
		va.AddBuffer(vb, layout);

		IndexBuffer ib(indices, 12);
		glm::mat4 proj;
		proj = glm::perspective(glm::radians(45.0f), (float)width/(float)height, 0.1f, 1000.0f);
		glm::mat4 view = camera.GetViewMatrix();
		glm::mat4 model = glm::rotate(glm::mat4(1.0f), glm::radians(-100.0f), glm::vec3(1.0f,0.0f,0.0f));
		glm::mat4 mvp = proj * view * model;

		Shader shader("../res/shaders/Basic.shader");

		shader.Bind();
		shader.SetUniformMat4f("u_MVP", mvp);

		va.Unbind();
		shader.Unbind();
		vb.Unbind();
		ib.Unbind();

		Renderer renderer;

		ImGui::CreateContext();
		ImGui::StyleColorsDark();
		ImGui_ImplGlfw_InitForOpenGL(window, true);
		const char* glsl_version = "#version 330";
		ImGui_ImplOpenGL3_Init(glsl_version);

		bool show_demo_window = true;
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

		shader.Bind();
		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;
		shader.SetUniformMat4f("u_MVP", mvp);
		
		renderer.Draw(va,ib,shader, GL_LINES);
		
		{
			/*
		// The next section is temporary use of the imgui library this will allow for interactivity for our application
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		if (show_demo_window)
            ImGui::ShowDemoWindow(&show_demo_window);

        // 2. Show a simple window that we create ourselves. We use a Begin/End pair to created a named window.
        {
            static float f = 0.0f;
            static int counter = 0;

            ImGui::Begin("Hello, world!");                          // Create a window called "Hello, world!" and append into it.

            ImGui::Text("This is some useful text.");               // Display some text (you can use a format strings too)
            ImGui::Checkbox("Demo Window", &show_demo_window);      // Edit bools storing our window open/close state
            ImGui::Checkbox("Another Window", &show_another_window);

            ImGui::SliderFloat("float", &f, 0.0f, 1.0f);            // Edit 1 float using a slider from 0.0f to 1.0f
            ImGui::ColorEdit3("clear color", (float*)&clear_color); // Edit 3 floats representing a color

            if (ImGui::Button("Button"))                            // Buttons return true when clicked (most widgets return true when edited/activated)
                counter++;
            ImGui::SameLine();
            ImGui::Text("counter = %d", counter);

            ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
            ImGui::End();
        }

        // 3. Show another simple window.
        if (show_another_window)
        {
            ImGui::Begin("Another Window", &show_another_window);   // Pass a pointer to our bool variable (the window will have a closing button that will clear the bool when clicked)
            ImGui::Text("Hello from another window!");
            if (ImGui::Button("Close Me"))
                show_another_window = false;
            ImGui::End();
        }
		*/
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