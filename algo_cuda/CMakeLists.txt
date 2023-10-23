cmake_minimum_required(VERSION 3.21)
project(algo_cuda CUDA)

set(CMAKE_CUDA_STANDARD 17)

#set(CMAKE_CUDA_COMPILER "C:\\Program Files\\NVIDIA GPU Computing Toolkit\\CUDA\\v12.3\\bin\\nvcc.exe")

add_executable(algo_cuda main.cu)
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -v")

#set_target_properties(algo_cuda PROPERTIES
#        CUDA_SEPARABLE_COMPILATION ON)
