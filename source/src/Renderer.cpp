#include "Renderer.h"

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
