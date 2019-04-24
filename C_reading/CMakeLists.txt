cmake_minimum_required(VERSION 3.13)
project(C_reading C)

set(CMAKE_C_STANDARD 99)

add_executable(C_reading main.c tree.c)
target_link_libraries(C_reading m)
