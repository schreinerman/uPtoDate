#!/bin/sh
source utils.sh

fixPermissions() {
    echo_green "Fixing permissions..."
    sudo chown -R $(whoami):admin $(brew --prefix)/*
    if [ -d "/Library/Frameworks/Python.framework/Versions" ]
    then
        sudo chown -R $(whoami):admin "/Library/Frameworks/Python.framework/Versions"
    fi
    
}