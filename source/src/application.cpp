#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include "graphicsIncludes.h"
#include "vendorIncludes.h"
#include "Renderer.h"
#include "Grid.h"
#include "Camera.h"
#include "Input.h"
#include "GUI.h"
#include "Window.h"


// camera
Camera camera(glm::vec3(70.0f, 30.0f, 260.0f));
// timing
float deltaTime = 0.0f;	
float lastFrame = 0.0f;
const int width = 1600;
const int height = 1000;

int main(void){
	Window window(width, height);

	glm::mat4 proj;
	proj = glm::perspective(glm::radians(45.0f), (float)width/(float)height, 0.1f, 400.0f);
	glm::mat4 view = camera.GetViewMatrix();
	glm::mat4 model = glm::mat4(1.0f);//glm::rotate(glm::mat4(1.0f), glm::radians(-100.0f), glm::vec3(1.0f,0.0f,0.0f));
	glm::mat4 mvp = proj * view * model;
		
	Renderer renderer;	
	Grid grid(5.0f, mvp);
	GUI gui(window.ptr);
	
    while(!window.shouldClose()){
        float currentFrame = glfwGetTime();
        deltaTime = currentFrame - lastFrame;
        lastFrame = currentFrame;

		renderer.Clear();
		gui.NewFrame();
		Input::processInput(window.ptr, camera, deltaTime);

		glm::mat4 view = camera.GetViewMatrix();
		mvp = proj*view*model;

		grid.Update(mvp);	
		renderer.Draw(grid);

		gui.CameraWindowUpdate(camera);
		gui.Render();
		window.Update();
    }
    return 0;
}