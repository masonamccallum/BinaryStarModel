#include <GL/glew.h>
#include <GLFW/glfw3.h>

class Window{
    GLFWwindow* window;
public:
    GLFWwindow* ptr;
    Window(const int, const int, GLFWcursorposfun fncPtr);
    ~Window(){};
    bool shouldClose();
    void Update();
};