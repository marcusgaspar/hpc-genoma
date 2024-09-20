#!/bin/bash

project_folder_name="genomica-proj"
# check locker name:
#cyclecloud locker list
locker_name="genomica-locker"

echo "Uploading project $project_folder_name to locker $locker_name"

cd $project_folder_name

# Upload project
cyclecloud project upload $locker_name

echo "Project $project_folder_name uploaded to locker $locker_name"