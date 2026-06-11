#!/bin/bash
echo -e "\e[38;5;82mInstalling rsasaki/lidarslam_ros2...\033[0m"



#---------------------------------------------INSTALL BASIC DEPENDENCIES---------------------------------------------


sudo apt install python3-colcon-common-extensions #FK installs colcon, which is a command line tool for working with multiple software packages
sudo apt install python3-rosdep #FK install rosdep if it isn't there already (because it will be used as part of building the SLAM)



#---------------------------------------------SETUP WORKSPACE---------------------------------------------


mkdir -p ~/Apps/ros2_ws/src #FK set up a workspace for ros2 software packages. #AB 2026-06-02 this directory is automatically created by DAI
cd ~/Apps/ros2_ws/src
git clone --recursive https://github.com/rsasaki0109/lidarslam_ros2 #FK clones the github that has the code for our SLAM software package, called lidarslam_ros2; the documentation for lidarslam_ros2 says the recursive is necessary. #AB The "recursive" flag indicates that git should clone submodules--basically small git repos inside other repos.



#---------------------------------------------INSTALL g2o DEPENDENCY---------------------------------------------


#FK install g2o (a dependency of graph_based_slam, one of the packages within our SLAM software package)
sudo apt install libeigen3-dev libspdlog-dev libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5 #FK install g2o's dependencies
cd ~/Apps/ros2_ws/src
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
mkdir build
cd build
cmake ../
make

# sudo cp ~/Apps/ros2_ws/src/g2o/cmake_modules/FindG2O.cmake /usr/share/cmake-3.28/Modules #FK attempt to fix g2o CMake error, didn't seem to work but may be relevant for later???



#---------------------------------------------COLCON BUILD lidarslam_ro2---------------------------------------------

#AB Remaining task: colcon build the package