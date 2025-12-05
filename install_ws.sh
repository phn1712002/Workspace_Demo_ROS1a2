#!/bin/bash

# Detect installed ROS version
if [ -f "/opt/ros/noetic/setup.bash" ]; then
    ROS_VERSION="noetic"
    source "/opt/ros/$ROS_VERSION/setup.bash"
elif [ -f "/opt/ros/humble/setup.bash" ]; then
    ROS_VERSION="humble"
    source "/opt/ros/$ROS_VERSION/setup.bash"

else
    echo "ERROR: No ROS installation found in /opt/ros/"
    exit 1
fi

case $ROS_VERSION in
    1)
        # Build ROS1 workspaces
        echo "Building ROS1 workspaces..."
        if [ -d "catkin_ws" ]; then
            cd catkin_ws && catkin_make
            cd ..
            echo "catkin_ws built successfully"
            echo "Sourced catkin_ws setup.bash"
        else
            echo "catkin_ws not found - skipping"
        fi
        ;;
    2)  
        # Build ROS2 workspaces  
        echo "Building ROS2 workspaces..."
        if [ -d "colcon_ws" ]; then
            cd colcon_ws && colcon build
            cd ..
            echo "colcon_ws built successfully"
            echo "Sourced colcon_ws setup.bash"
        else
            echo "colcon_ws not found - skipping"
        fi
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Ask about git repo handling
echo "Do you want to use this as a NEW project or REUSE/DEVELOP existing project?"
echo "1) NEW project (delete .git and initialize new repository)"
echo "2) REUSE/DEVELOP existing project (keep .git)"
read -p "Enter choice (1 or 2): " git_choice

case $git_choice in
    1)
        echo "Setting up as NEW project - removing .git and README.md, initializing new repository"
        rm -rf .git
        if [ -f "README.md" ]; then
            rm README.md
            echo "README.md removed"
        fi
        git init
        echo "New git repository initialized"
        ;;
    2)
        echo "Keeping existing .git for REUSE/DEVELOPMENT"
        ;;
    *)
        echo "Invalid choice - keeping existing .git"
        ;;
esac
