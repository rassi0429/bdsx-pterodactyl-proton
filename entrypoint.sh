#!/bin/bash
cd /home/container/

# Create Directories and Enviroment Variables for Proton
export STEAM_COMPAT_CLIENT_INSTALL_PATH="/home/container/.steam/steam"
export STEAM_COMPAT_DATA_PATH="/home/container/.steam/steam/steamapps/compatdata/0"
mkdir -p $STEAM_COMPAT_DATA_PATH


echo hi
ls -la /home/container/

${STARTUP}