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
	Window window(width, height, mouse_callback);

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