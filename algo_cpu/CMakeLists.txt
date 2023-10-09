cmake_minimum_required(VERSION 3.26)
project(algo_cpu)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)

include_directories(include)

add_executable(algo_cpu main.c)

add_executable(test_nw test/test_nw.c)