#pragma once

#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

#include <string>
namespace lve {
	class  LveWindow
	{
	public:
		LveWindow(int w, int h, std::string name);
		~LveWindow(); //窗口销毁时候

		LveWindow(const LveWindow&) = delete; //禁止拷贝
		LveWindow& operator=(const LveWindow&) = delete; //禁止赋值

		bool shouldClose() { return glfwWindowShouldClose(window); };
	private:
		void initWindow();
		const int width;
		const int height;

		std::string windowName;
		GLFWwindow *window;
	};
}