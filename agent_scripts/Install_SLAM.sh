#!/bin/bash

source /opt/ros/jazzy/setup.bash #FK source the version of ros

# INSTALL THE GITHUB THAT IS A DEPENDENCY OF THE MAIN SLAM GITHUB

sudo apt install python3-colcon-common-extensions -y #AB 2026-06-15 added this installer to DAI

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
# ros2 run ndt_omp_ros2 align data/251370668.pcd data/251371071.pcd

# INSTALL THE MAIN SLAM GITHUB
# insert stuff here

#AB Install the slam repo and some more of its dependencies
sudo apt install python3-rosdep -y #AB install rosdep, which I guess doens't come  by default! NB! python3-rosdep2 is only for Debian--python3-rosdep is for Ubuntu 
#AB 2026-06-15 added the above installer to DAI
sudo rosdep init #AB turn on rosdep
rosdep update  #AB update rosdep

cd ~/Apps/ros2_ws/src
git clone --recursive https://github.com/rsasaki0109/lidarslam_ros2
touch ~/Apps/ros2_ws/src/lidarslam_ros2/Thirdparty/ndt_omp_ros2/COLCON_IGNORE #AB Tell colcon to ignore the ndt_amp_ros2 package which comes bundled with the git repo
cd ..
rosdep install --from-paths src --ignore-src -r -y #AB Automatically install dependencies of the SLAM repo

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release #AB Colcon build the SLAM package

echo 'source ~/Apps/ros2_ws/src/ndt_omp_ros2/install/setup.bash' >> ~/.bashrc #AB Add command to source the SLAM package upon terminal startup to the system ~/.bashrc file.
echo -e "\e[38;5;82mSLAM installation complete.\033[0m"
