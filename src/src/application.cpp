//g++ testTwo.cpp -o tTwo -lglfw -lGL -lGLEW
#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <fstream>
#include <sstream>

#include "Renderer.h"
#include "VertexBuffer.h"
#include "IndexBuffer.h"

struct ShaderProgramSource{
  std::string VertexSource;
  std::string FragmentSource;
};

static ShaderProgramSource ParseShader(const std::string& file){
  std::cout << "Parsing Shader" << std::endl;
  std::ifstream stream(file);
  enum class ShaderType{
    NONE = -1, VERTEX = 0, FRAGMENT = 1
  };

  std::string line;
  std::stringstream ss[2];
  ShaderType type = ShaderType::NONE;
  while(getline(stream,line)){
    std::cout << line << std::endl;
    if(line.find("#shader") != std::string::npos){
      if(line.find("vertex") != std::string::npos){
        type = ShaderType::VERTEX;
      }else if(line.find("fragment") != std::string::npos){
        type = ShaderType::FRAGMENT;
      }
    }else{
      ss[(int) type] << line << '\n';
    }
  }
  return{ss[0].str(), ss[1].str()};
}

static unsigned int CompileShader(unsigned int type, const std::string& source){
  unsigned int id = glCreateShader(type);
  const char* src = source.c_str();
  glShaderSource(id, 1, &src, nullptr);
  glCompileShader(id);

  int result;
  glGetShaderiv(id, GL_COMPILE_STATUS,&result);
  if(result == GL_FALSE){
    int length;
    glGetShaderiv(id, GL_INFO_LOG_LENGTH, &length);
    char* message = (char*) alloca(length * sizeof(char));
    glGetShaderInfoLog(id, length, &length, message);
    std::cout << "Failed to compile shader" << std::endl;
    std::cout << message << std::endl;
    glDeleteShader(id);
    return 0;
  }

  return id;
}

static unsigned int CreateShader(const std::string& vertexShader, const std::string &fragmentShader){
  unsigned int program = glCreateProgram();
  unsigned int vs = CompileShader(GL_VERTEX_SHADER, vertexShader);
  unsigned int fs = CompileShader(GL_FRAGMENT_SHADER, fragmentShader);

  glAttachShader(program, vs);
  glAttachShader(program, fs);
  glLinkProgram(program);
  glValidateProgram(program);
  glDeleteShader(vs);
  glDeleteShader(fs);
  return program;
}


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
     -0.5f, -0.5f,
      0.5f, -0.5f,
			0.3f,  0.3f,
	   -0.3f,  0.3f,
    };
	
		unsigned int indices[] = {
		0,1,2,
		2,3,0
		};

		VertexBuffer vb(positions, 4*2*sizeof(float));
    
		glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 2 * sizeof(float), 0);

		IndexBuffer ib(indices, 6);


    ShaderProgramSource source = ParseShader("../res/shaders/Basic.shader");
	
    unsigned int shader = CreateShader(source.VertexSource, source.FragmentSource);

    glUseProgram(shader);
		unsigned int location = glGetUniformLocation(shader,"u_Color");
		glUniform4f(location, 0.3f,0.3f,0.8f,1.0f);
    while(!glfwWindowShouldClose(window)){
      glClear(GL_COLOR_BUFFER_BIT);
			ib.Bind();
      glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, nullptr);
      glfwSwapBuffers(window);
			glfwPollEvents();
    }
		
		glfwDestroyWindow(window);
    glDeleteProgram(shader);
    glfwTerminate();
    return 0;
}
