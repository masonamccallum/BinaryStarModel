#shader vertex
#version 330 core
layout(location = 0) in vec4 position;
layout(location = 1) in vec4 velocity;
uniform mat4 u_MVP;
out vec4 v_color;
float velColor;

void main(){
	velColor = length(velocity);
	//note: Could use velColor for color component 
  v_color = vec4(1.0,0.0,0.0,1.0);
  gl_Position = u_MVP * position;
};

#shader fragment
#version 330 core
layout(location=0) out vec4 color;

in vec4 v_color;
void main(){
  color = v_color;
};
