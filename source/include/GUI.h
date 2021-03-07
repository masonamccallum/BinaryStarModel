#include "../src/vendor/imgui/imgui.h"
#include "../src/vendor/imgui/imgui_impl_glfw.h"
#include "../src/vendor/imgui/imgui_impl_opengl3.h"
#include "Camera.h"

class GUI{
private:
    const char* glsl_version = "#version 330";
    ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
public:
    GUI(GLFWwindow* window){
        ImGui::CreateContext();
        ImGui::StyleColorsDark();
        ImGui_ImplGlfw_InitForOpenGL(window, true);
        ImGui_ImplOpenGL3_Init(glsl_version);
    }

    ~GUI(){
        ImGui_ImplOpenGL3_Shutdown();
        ImGui_ImplGlfw_Shutdown();
        ImGui::DestroyContext();
    }

    void NewFrame(){
       ImGui_ImplOpenGL3_NewFrame(); 
       ImGui_ImplGlfw_NewFrame();
       ImGui::NewFrame();
    }

    void CameraWindowUpdate(Camera& camera){
        ImGui::Text("Camera Position: X:%.3f, Y:%.3f, Z:%.3f",camera.Position.x,camera.Position.y,camera.Position.z);
        ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
    }

    void Render(){
        ImGui::Render();
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
    }
};
