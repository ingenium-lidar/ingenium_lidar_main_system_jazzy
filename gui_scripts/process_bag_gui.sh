cd ~/ingenium_lidar_main_system_jazzy/ || exit
file=$(zenity --file-selection --title="Choose a bag file" --file-filter="*.bag")
chmod +x ~/ingenium_lidar_main_system_jazzy/process_bag.sh
zenity --question --text="Spawn RVIZ window?" --width=150
if [ $? = 1 ]; then
  gnome-terminal --working-directory=~/ingenium_lidar_main_system_jazzy/ -- ~/ingenium_lidar_main_system_jazzy/process_bag.sh "$file"
else
  gnome-terminal --working-directory=~/ingenium_lidar_main_system_jazzy/ -- ~/ingenium_lidar_main_system_jazzy/process_bag.sh "$file" -v
fi
