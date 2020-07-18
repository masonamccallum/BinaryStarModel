//g++ testTwo.cpp -o tTwo -lglfw -lGL -lGLEW
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

int main(void){
  GLFWwindow* window;
  if(!glfwInit()){
    return -1;
  }
		
    glfwInit();
    window = glfwCreateWindow(600,800,"learn GLFW",NULL, NULL);
    if(!window){
      glfwTerminate();
      return -1;
    }

    glfwMakeContextCurrent(window);
		glfwSwapInterval(1);

    if(glewInit() != GLEW_OK){
      std::cout << "ERROR" << std::endl;
    }
    
    float positions[] = {
			100.0f, 100.0f, 0.0f, 0.0f,
			200.0f, 100.0f, 1.0f, 0.0f, 
			200.0f, 200.0f, 1.0f, 1.0f,
			100.0f, 200.0f, 0.0f, 1.0f
    };
	
		unsigned int indices[] = {
		0,1,2,
		2,3,0
		};
		
		VertexArray va;
		VertexBuffer vb(positions, 4*4*sizeof(float));
    
		VertexBufferLayout layout;
		layout.Push<float>(2);
		layout.Push<float>(2);
		va.AddBuffer(vb, layout);

		IndexBuffer ib(indices, 6);

		glm::mat4 proj = glm::ortho(-0.0f, 960.0f, -0.0f, 540.0f, -1.0f, 1.0f);
		glm::vec4 vp(100.0f,100.0f,0.0f,1.0f);
		

		Shader shader("../res/shaders/Basic.shader");

		shader.Bind();
		shader.SetUniform4f("u_color", 0.8f,0.3f,0.8f,1.0f);
		shader.SetUniformMat4f("u_MVP", proj);

		va.Unbind();
		shader.Unbind();
		vb.Unbind();
		ib.Unbind();

		Renderer renderer;

    while(!glfwWindowShouldClose(window)){
			renderer.Clear();
			shader.Bind();
			shader.SetUniform4f("u_color", 0.8f,0.3f,0.8f,1.0f);

			renderer.Draw(va,ib,shader);

      glfwSwapBuffers(window);
			glfwPollEvents();
    }
		
		glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}
