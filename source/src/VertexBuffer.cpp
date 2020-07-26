#include "VertexBuffer.h"
#include "Renderer.h"
#include "Vertex.h"

VertexBuffer::VertexBuffer(unsigned int count){
    glGenBuffers(1, &m_RendererID);
    glBindBuffer(GL_ARRAY_BUFFER, m_RendererID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertex) * count, nullptr, GL_DYNAMIC_DRAW);
}

VertexBuffer::~VertexBuffer(){
	glDeleteBuffers(1, &m_RendererID);
}

void VertexBuffer::Bind() const{
    glBindBuffer(GL_ARRAY_BUFFER, m_RendererID);
}

void VertexBuffer::Unbind() const{
    glBindBuffer(GL_ARRAY_BUFFER, 0); 
}

void VertexBuffer::Update(float * verticies) const{
    Bind();
    glBufferSubData(GL_ARRAY_BUFFER, 0, 5*8*sizeof(float), verticies);
}
