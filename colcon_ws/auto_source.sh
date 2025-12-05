#!/bin/bash

echo "Auto-sourcing workspace setup files..."

# Check if ROS1 or ROS2 was used
if [ -f "catkin_ws/devel/setup.bash" ]; then
    echo "Detected ROS1 workspace"
    source devel/setup.bash
    echo "Sourced ROS1 workspace setup files"
elif [ -f "colcon_ws/install/setup.bash" ]; then
    echo "Detected ROS2 workspace"
    source install/setup.bash
    echo "Sourced ROS2 workspace setup files"
else
    echo "ERROR: No valid workspace setup files found"
    exit 1
fi

echo "Workspace environment ready"
