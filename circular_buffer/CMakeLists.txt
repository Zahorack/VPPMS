cmake_minimum_required(VERSION 3.15)
project(circular_buffer C)

set(CMAKE_C_STANDARD 99)

add_executable(circular_buffer main.c circular.c circular.h)