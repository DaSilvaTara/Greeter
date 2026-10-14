#pragma once
#include <string>

namespace greeter
{
	// Return the name of the system the program was built on:
	// "Linux", "Window" or "Darwin" (macOS)
	// The value comes from CMake (CMAKE_SYSTEM_NAME), at confgure time.
	std::string get_build_system();

	// Return "built on <system> with <compiler> <compiler version>".
	std::string get_build_info();
} // namespace greeter



