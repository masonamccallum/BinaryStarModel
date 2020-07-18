#pragma once
#include <GL/glew.h>
#include "IndexBuffer.h"
#include "VertexArray.h"
#include "Shader.h"

class Renderer{
private:
public:
	void Clear() const;
	void Draw(const VertexArray& a, const IndexBuffer& ib, const Shader& shader) const;
};


