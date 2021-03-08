#pragma once
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include "Camera.h"

namespace mouse{
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
    float yoffset = lastY - ypos;
    lastX = xpos;
    lastY = ypos;
    camera.ProcessMouseMovement(xoffset, yoffset);
}
}
