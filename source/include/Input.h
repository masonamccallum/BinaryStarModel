#pragma once
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include "Camera.h"

namespace Input{
    void processInput(GLFWwindow*, Camera&, float);
}