#include "Window.h"

Window::Window(const int width, const int height){
    glfwInit();
    window = glfwCreateWindow(width, height, "Mason A. McCallum", NULL,NULL);
    ptr = window;
    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);
    glewInit();
    glfwSetInputMode(window, GLFW_RAW_MOUSE_MOTION, GLFW_TRUE);
}

bool Window::shouldClose(){
    if(glfwWindowShouldClose(window)){
        return true;
    }else{
        return false;
    }
}

void Window::Update(){
   glfwSwapBuffers(window);
   glfwPollEvents();
}