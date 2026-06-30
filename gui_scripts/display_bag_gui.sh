source install_isolated/setup.bash
cd ~/ingenium_lidar_main_system_jazzy/ || exit
file=$(zenity --file-selection --title="Choose a bag file" --file-filter="*.bag")
chmod +x ~/ingenium_lidar_main_system_jazzy/display_bag.sh
gnome-terminal --working-directory=~/ingenium_lidar_main_system_jazzy/ -- ~/ingenium_lidar_main_system_jazzy/display_bag.sh "$file"
