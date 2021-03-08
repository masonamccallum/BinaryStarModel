#pragma once
#include "VertexBuffer.h"
#include "VertexArray.h"
#include "VertexBufferLayout.h"
#include "IndexBuffer.h"
#include "Shader.h"
#include <iostream>

class Grid{
private:
    static const unsigned int numRowCol = 30;
    float gridSquareSize;
	float verts[4*4*(numRowCol + 1)]; // WARNING: 4 hard codes the layout of each vertex
	unsigned int idx[4*(numRowCol+1)];
    VertexBuffer* vb;
    VertexBufferLayout layout;
public:
    VertexArray va; //no copy needed
    IndexBuffer* ib;
    Shader* shader_ptr;
    
    Grid(float,glm::mat4&);
    ~Grid();
    
    void Bind(){
        shader_ptr->Bind();
        va.Bind();
        ib->Bind(); 
    }

    int getIBCount(){return ib->GetCount();} 
    
    void Update(glm::mat4& mvp){
        shader_ptr->Bind();
        shader_ptr->SetUniformMat4f("u_MVP", mvp);
        vb->Update(verts);
    }

private:
    void initIdx();
    void initVertexBuffer();
};
