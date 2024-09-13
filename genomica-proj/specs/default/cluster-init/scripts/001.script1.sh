#!/bin/bash
#set -ex

# Capture start time
start_time=$(date +%s)

echo "### start"
# download aznfs installer
sudo su - 
exec 1>/var/log/001-script-cluster-init.log 2>&1
export AZNFS_NONINTERACTIVE_INSTALL=1
export AZMNT=/data2
echo "### wget and install"
wget -O - -q https://github.com/Azure/AZNFS-mount/releases/latest/download/aznfs_install.sh | bash
echo "### mkdir"
mkdir $AZMNT
echo "### chmod"
chmod 777 $AZMNT
echo "### chown"
chown -R azureadmin:cyclecloud $AZMNT
echo "### mount"
mount -t aznfs -o defaults,sec=sys,vers=3,nolock,proto=tcp,nofail,_netdev samgdatatransfer.blob.core.windows.net:/samgdatatransfer/data $AZMNT

echo "cyclecloud spec path:" $CYCLECLOUD_SPEC_PATH

# Capture end time
end_time=$(date +%s)
# Calculate duration
duration=$((end_time - start_time))
# Format duration to hh:mm:ss
hours=$(printf "%02d" $((duration / 3600)))
minutes=$(printf "%02d" $(( (duration % 3600) / 60 )))
seconds=$(printf "%02d" $((duration % 60)))
duration="${hours}:${minutes}:${seconds}"

echo "script finished."
echo "Execution time (hh:mm:ss): $duration"

