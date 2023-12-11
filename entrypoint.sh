#!/bin/bash
cd /home/container/

git clone https://github.com/bdsx/bdsx
cd bdsx
bash ./update.sh
sed -i '13s/^/#/' /home/container/bdsx/bdsx.sh
sed -i '16iWINE="proton run"' /home/container/bdsx/bdsx.sh

# Create Directories and Enviroment Variables for Proton
export STEAM_COMPAT_CLIENT_INSTALL_PATH="/home/container/.steam/steam"
export STEAM_COMPAT_DATA_PATH="/home/container/.steam/steam/steamapps/compatdata/0"
mkdir -p $STEAM_COMPAT_DATA_PATH

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container/$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}