#include "Renderer.h"

void Renderer::Clear() const{
	glClear(GL_COLOR_BUFFER_BIT);
}

void Renderer::Draw(const VertexArray& va, const IndexBuffer& ib, const Shader& shader) const{
	shader.Bind();
	ib.Bind();
	va.Bind();
	//glDrawElements(GL_POINTS, ib.GetCount(), GL_UNSIGNED_INT, nullptr);
	glDrawElements(GL_TRIANGLES, ib.GetCount(), GL_UNSIGNED_INT, nullptr);
}
