#include <GL/glew.h>
#include "../src/vendor/glm/glm.hpp"
#include "../src/vendor/glm/gtc/matrix_transform.hpp"
#include <vector>

// Defines several possible options for camera movement. Used as abstraction to stay away from window-system specific input methods
enum Camera_Movement {
    FORWARD,
    BACKWARD,
    LEFT,
    RIGHT
};

// An abstract camera class that processes input and calculates the corresponding Euler Angles, Vectors and Matrices for use in OpenGL
class particlePlotter 
{
public:
    // constructor with vectors
	particlePlotter(){

	}

  void ProcessKeyboard(Camera_Movement direction, float deltaTime){
        float velocity = MovementSpeed * deltaTime;
        if (direction == FORWARD)
            Position += Front * velocity;
        if (direction == BACKWARD)
            Position -= Front * velocity;
        if (direction == LEFT)
            Position -= glm::normalize(glm::cross(Front, Up)) * velocity;
        if (direction == RIGHT)
            Position += glm::normalize(glm::cross(Front, Up)) * velocity;
    }

private:

};
#endif

