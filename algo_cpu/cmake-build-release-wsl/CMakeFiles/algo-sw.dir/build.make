# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl

# Include any dependencies generated for this target.
include CMakeFiles/algo-sw.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/algo-sw.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/algo-sw.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/algo-sw.dir/flags.make

CMakeFiles/algo-sw.dir/include/bio_cpu.c.o: CMakeFiles/algo-sw.dir/flags.make
CMakeFiles/algo-sw.dir/include/bio_cpu.c.o: ../include/bio_cpu.c
CMakeFiles/algo-sw.dir/include/bio_cpu.c.o: CMakeFiles/algo-sw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/algo-sw.dir/include/bio_cpu.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/algo-sw.dir/include/bio_cpu.c.o -MF CMakeFiles/algo-sw.dir/include/bio_cpu.c.o.d -o CMakeFiles/algo-sw.dir/include/bio_cpu.c.o -c /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/include/bio_cpu.c

CMakeFiles/algo-sw.dir/include/bio_cpu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/algo-sw.dir/include/bio_cpu.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/include/bio_cpu.c > CMakeFiles/algo-sw.dir/include/bio_cpu.c.i

CMakeFiles/algo-sw.dir/include/bio_cpu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/algo-sw.dir/include/bio_cpu.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/include/bio_cpu.c -o CMakeFiles/algo-sw.dir/include/bio_cpu.c.s

CMakeFiles/algo-sw.dir/include/fasta.c.o: CMakeFiles/algo-sw.dir/flags.make
CMakeFiles/algo-sw.dir/include/fasta.c.o: ../include/fasta.c
CMakeFiles/algo-sw.dir/include/fasta.c.o: CMakeFiles/algo-sw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/algo-sw.dir/include/fasta.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/algo-sw.dir/include/fasta.c.o -MF CMakeFiles/algo-sw.dir/include/fasta.c.o.d -o CMakeFiles/algo-sw.dir/include/fasta.c.o -c /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/include/fasta.c

CMakeFiles/algo-sw.dir/include/fasta.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/algo-sw.dir/include/fasta.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/include/fasta.c > CMakeFiles/algo-sw.dir/include/fasta.c.i

CMakeFiles/algo-sw.dir/include/fasta.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/algo-sw.dir/include/fasta.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/include/fasta.c -o CMakeFiles/algo-sw.dir/include/fasta.c.s

CMakeFiles/algo-sw.dir/main_sw.c.o: CMakeFiles/algo-sw.dir/flags.make
CMakeFiles/algo-sw.dir/main_sw.c.o: ../main_sw.c
CMakeFiles/algo-sw.dir/main_sw.c.o: CMakeFiles/algo-sw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/algo-sw.dir/main_sw.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/algo-sw.dir/main_sw.c.o -MF CMakeFiles/algo-sw.dir/main_sw.c.o.d -o CMakeFiles/algo-sw.dir/main_sw.c.o -c /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/main_sw.c

CMakeFiles/algo-sw.dir/main_sw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/algo-sw.dir/main_sw.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/main_sw.c > CMakeFiles/algo-sw.dir/main_sw.c.i

CMakeFiles/algo-sw.dir/main_sw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/algo-sw.dir/main_sw.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/main_sw.c -o CMakeFiles/algo-sw.dir/main_sw.c.s

# Object files for target algo-sw
algo__sw_OBJECTS = \
"CMakeFiles/algo-sw.dir/include/bio_cpu.c.o" \
"CMakeFiles/algo-sw.dir/include/fasta.c.o" \
"CMakeFiles/algo-sw.dir/main_sw.c.o"

# External object files for target algo-sw
algo__sw_EXTERNAL_OBJECTS =

algo-sw: CMakeFiles/algo-sw.dir/include/bio_cpu.c.o
algo-sw: CMakeFiles/algo-sw.dir/include/fasta.c.o
algo-sw: CMakeFiles/algo-sw.dir/main_sw.c.o
algo-sw: CMakeFiles/algo-sw.dir/build.make
algo-sw: CMakeFiles/algo-sw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable algo-sw"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/algo-sw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/algo-sw.dir/build: algo-sw
.PHONY : CMakeFiles/algo-sw.dir/build

CMakeFiles/algo-sw.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/algo-sw.dir/cmake_clean.cmake
.PHONY : CMakeFiles/algo-sw.dir/clean

CMakeFiles/algo-sw.dir/depend:
	cd /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl /mnt/c/Users/vivat/Desktop/git_target/bioinformatics-2110581/algo_cpu/cmake-build-release-wsl/CMakeFiles/algo-sw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/algo-sw.dir/depend

