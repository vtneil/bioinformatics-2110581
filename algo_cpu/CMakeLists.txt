cmake_minimum_required(VERSION 3.26)
project(algo_cpu)

set(CMAKE_C_STANDARD 17)

# Include local library and set sources
include_directories(include)
set(SOURCES
        include/bio_cpu.c
)

# CPU: Serial
add_executable(algo-nw
        ${SOURCES}
        main_nw.c
)
target_compile_options(algo-nw PRIVATE -O2)


add_executable(algo-sw
        ${SOURCES}
        main_sw.c
)
target_compile_options(algo-sw PRIVATE -O2)


# CPU: OpenMP Parallel
add_executable(algo-nw-openmp
        ${SOURCES}
        main_nw.c
)
target_compile_options(algo-nw-openmp PRIVATE -fopenmp -v)
target_link_libraries(algo-nw-openmp PRIVATE -fopenmp -v)
