#shader vertex
#version 330 core
layout(location = 0) in vec4 position;
layout(location = 2) in vec4 a_color;
uniform mat4 u_MVP;

out vec4 v_color;

void main(){
  v_color = a_color;
  gl_Position = u_MVP * position;
};

#shader fragment
#version 330 core
layout(location=0) out vec4 color;

in vec4 v_color;
void main(){
  color = v_color;
};
