#!/bin/bash

input_pcd="$1"
output_ply="${input_pcd%.pcd}.ply"

pcl_pcd2ply "$input_pcd" "$output_ply"