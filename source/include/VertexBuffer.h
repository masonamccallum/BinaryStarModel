#pragma once

class VertexBuffer{
	private:
		unsigned int m_RendererID;
	public:
			VertexBuffer(unsigned int size);
			~VertexBuffer();

			void Bind() const;
			void Unbind() const;
			void Update(float*) const;
};
