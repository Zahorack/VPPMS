cmake_minimum_required(VERSION 3.15)
project(fourier_transform C)

set(CMAKE_C_STANDARD 99)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 ")
#set(SOURCE_FILES main.c)


add_executable(fourier_transform main.c)

target_link_libraries(fourier_transform m)