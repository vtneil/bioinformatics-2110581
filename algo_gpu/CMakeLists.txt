cmake_minimum_required(VERSION 3.26)
project(algo_gpu CUDA)

set(CMAKE_CUDA_STANDARD 17)

add_executable(algo_gpu main.cu)

set_target_properties(algo_gpu PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
