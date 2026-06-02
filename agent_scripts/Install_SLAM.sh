#!/bin/bash


# INSTALL THE GITHUB THAT IS A DEPENDENCY OF THE MAIN SLAM GITHUB
cd ~
sudo apt install python3-colcon-common-extensions
#FK source the version of ros
source /opt/ros/jazzy/setup.bash
mkdir -p ~/Apps/ros2_ws/src #AB 2026-06-02 this directory is automatically created by DAI
echo -e "\e[38;5;5m If you got a 'fatal' error saying ros2_ws already exists, do not worry. Everything is OK. \033[0m"

cd ~/Apps/ros2_ws/src
git clone https://github.com/rsasaki0109/ndt_omp_ros2.git -b humble
cd ndt_omp_ros2
colcon build --executor sequential --cmake-clean-first
echo -e "\e[38;5;5m If you got depreciation warnings and such, but nothing labeled 'error' or something else really serious, do not worry. Everything is OK. \033[0m"
#FK source the ros setup script for this application specifically
source ~/Apps/ros2_ws/src/ndt_omp_ros2/install/setup.bash

#FK test it!
ros2 run ndt_omp_ros2 align data/251370668.pcd data/251371071.pcd

# INSTALL THE MAIN SLAM GITHUB
# insert stuff here


echo 'source ~/Apps/ros2_ws/src/ndt_omp_ros2/install/setup.bash' >> ~/.bashrc #AB Add command to source the SLAM package upon terminal startup to the system ~/.bashrc file.
echo -e "\e[38;5;82mSLAM installation complete.\033[0m"