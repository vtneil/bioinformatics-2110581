cmake_minimum_required(VERSION 3.22)
project(algo_gpu CUDA)

set(CMAKE_CUDA_STANDARD 17)

add_executable(algo_gpu main.cu)

set_target_properties(algo_gpu PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

set(CMAKE_CUDA_COMPILER
        "C:\\Program Files\\NVIDIA GPU Computing Toolkit\\CUDA\\v12.3\\bin\\nvcc.exe")