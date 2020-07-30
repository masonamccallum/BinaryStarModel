#pragma once

class VertexBuffer{
	private:
		unsigned int m_RendererID;
		unsigned int m_count;
	public:
			VertexBuffer(unsigned int size);
			VertexBuffer(){}
			~VertexBuffer();

			void Bind() const;
			void Unbind() const;
			void Update(float*) const;
};
