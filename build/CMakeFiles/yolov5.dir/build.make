# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ynu/Daydayup/yolov5_tensorRT

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ynu/Daydayup/yolov5_tensorRT/build

# Include any dependencies generated for this target.
include CMakeFiles/yolov5.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/yolov5.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/yolov5.dir/flags.make

CMakeFiles/yolov5.dir/yolov5.cpp.o: CMakeFiles/yolov5.dir/flags.make
CMakeFiles/yolov5.dir/yolov5.cpp.o: ../yolov5.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ynu/Daydayup/yolov5_tensorRT/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/yolov5.dir/yolov5.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/yolov5.dir/yolov5.cpp.o -c /home/ynu/Daydayup/yolov5_tensorRT/yolov5.cpp

CMakeFiles/yolov5.dir/yolov5.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/yolov5.dir/yolov5.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ynu/Daydayup/yolov5_tensorRT/yolov5.cpp > CMakeFiles/yolov5.dir/yolov5.cpp.i

CMakeFiles/yolov5.dir/yolov5.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/yolov5.dir/yolov5.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ynu/Daydayup/yolov5_tensorRT/yolov5.cpp -o CMakeFiles/yolov5.dir/yolov5.cpp.s

# Object files for target yolov5
yolov5_OBJECTS = \
"CMakeFiles/yolov5.dir/yolov5.cpp.o"

# External object files for target yolov5
yolov5_EXTERNAL_OBJECTS =

yolov5: CMakeFiles/yolov5.dir/yolov5.cpp.o
yolov5: CMakeFiles/yolov5.dir/build.make
yolov5: libyololayer.so
yolov5: /usr/local/lib/libopencv_dnn.so.4.4.0
yolov5: /usr/local/lib/libopencv_gapi.so.4.4.0
yolov5: /usr/local/lib/libopencv_highgui.so.4.4.0
yolov5: /usr/local/lib/libopencv_ml.so.4.4.0
yolov5: /usr/local/lib/libopencv_objdetect.so.4.4.0
yolov5: /usr/local/lib/libopencv_photo.so.4.4.0
yolov5: /usr/local/lib/libopencv_stitching.so.4.4.0
yolov5: /usr/local/lib/libopencv_video.so.4.4.0
yolov5: /usr/local/lib/libopencv_videoio.so.4.4.0
yolov5: /usr/local/cuda/lib64/libcudart.so
yolov5: /usr/local/lib/libopencv_imgcodecs.so.4.4.0
yolov5: /usr/local/lib/libopencv_calib3d.so.4.4.0
yolov5: /usr/local/lib/libopencv_features2d.so.4.4.0
yolov5: /usr/local/lib/libopencv_flann.so.4.4.0
yolov5: /usr/local/lib/libopencv_imgproc.so.4.4.0
yolov5: /usr/local/lib/libopencv_core.so.4.4.0
yolov5: CMakeFiles/yolov5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ynu/Daydayup/yolov5_tensorRT/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable yolov5"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yolov5.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/yolov5.dir/build: yolov5

.PHONY : CMakeFiles/yolov5.dir/build

CMakeFiles/yolov5.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/yolov5.dir/cmake_clean.cmake
.PHONY : CMakeFiles/yolov5.dir/clean

CMakeFiles/yolov5.dir/depend:
	cd /home/ynu/Daydayup/yolov5_tensorRT/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ynu/Daydayup/yolov5_tensorRT /home/ynu/Daydayup/yolov5_tensorRT /home/ynu/Daydayup/yolov5_tensorRT/build /home/ynu/Daydayup/yolov5_tensorRT/build /home/ynu/Daydayup/yolov5_tensorRT/build/CMakeFiles/yolov5.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/yolov5.dir/depend

