#include "Renderer.h"
#include <iostream>

void Renderer::Clear() const{
	glClear(GL_COLOR_BUFFER_BIT);
}

void Renderer::Draw(const VertexArray& va, const IndexBuffer& ib, const Shader& shader, const GLenum& TYPEOFDRAW) const{
	shader.Bind();
	ib.Bind();
	va.Bind();
	if(TYPEOFDRAW == GL_POINTS){
		glPointSize(3.0f);
	}else if(TYPEOFDRAW == GL_LINE){
		glLineWidth(3.0f);
	}
	glDrawElements(TYPEOFDRAW, ib.GetCount(), GL_UNSIGNED_INT, nullptr);
}

void Renderer::Draw(Grid& grid){
	while(glGetError() != GL_NO_ERROR);
	grid.Bind();
	int count = grid.getIBCount();
	glDrawElements(GL_LINES, count, GL_UNSIGNED_INT, nullptr);
	while(GLenum error = glGetError()){
		std::cout << "[OpenGL error] :" <<  error << std::endl;
	}
	
}