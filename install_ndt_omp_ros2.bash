#!/bin/bash

cd ~
sudo apt install python3-colcon-common-extensions
# source the version of ros
source /opt/ros/jazzy/setup.bash
mkdir -p ~/ros2_ws/src
echo -e "\e[38;5;5m If you got a 'fatal' error saying ros2_ws already exists, do not worry. Everything is OK. \033[0m"

cd ~/ros2_ws/src
git clone https://github.com/rsasaki0109/ndt_omp_ros2.git -b humble
cd ndt_omp_ros2


colcon build --executor sequential --cmake-clean-first
echo -e "\e[38;5;5m If you got depreciation warnings and such, but nothing labeled 'error' or something else really serious, do not worry. Everything is OK. \033[0m"
# source the ros setup script for this application specifically
source ~/ros2_ws/src/ndt_omp_ros2/install/setup.bash

# test it!
ros2 run ndt_omp_ros2 align data/251370668.pcd data/251371071.pcd
