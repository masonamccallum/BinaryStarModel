#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include "graphicsIncludes.h"
#include "vendorIncludes.h"
#include "Renderer.h"
#include "Grid.h"
#include "Camera.h"
#include "input.h"
#include "GUI.h"

// camera
Camera camera(glm::vec3(70.0f, 30.0f, 260.0f));
// timing
float deltaTime = 0.0f;	
float lastFrame = 0.0f;
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
	GUI gui(window);
	
    while(!glfwWindowShouldClose(window)){
        float currentFrame = glfwGetTime();
        deltaTime = currentFrame - lastFrame;
        lastFrame = currentFrame;

		renderer.Clear();
		gui.NewFrame();
		input::processInput(window, camera, deltaTime);

		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;

		grid.Update(mvp);	
		renderer.Draw(grid);

		gui.CameraWindowUpdate(camera);
		gui.Render();
      	glfwSwapBuffers(window);
		glfwPollEvents();
    }
    return 0;
}