#shader vertex
#version 330 core
layout(location = 0) in vec4 position;
uniform mat4 u_MVP;

out vec4 v_color;

void main(){
  v_color = vec4(0.2,0.2,0.2,1.0);
  gl_Position = u_MVP * position;
};

#shader fragment
#version 330 core
layout(location=0) out vec4 color;

in vec4 v_color;
void main(){
  color = v_color;
};
