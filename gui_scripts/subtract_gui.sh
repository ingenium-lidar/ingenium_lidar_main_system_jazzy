file1=$(zenity --file-selection --title="Choose first point cloud" --file-filter="*.ply")
file2=$(zenity --file-selection --title="Choose second point cloud" --file-filter="*.ply")
chmod +x ~/ingenium_lidar_main_system_jazzy/subtract.sh
gnome-terminal --working-directory=~/ingenium_lidar_main_system_jazzy/ -- ~/ingenium_lidar_main_system_jazzy/subtract.sh "$file1" "$file2"
