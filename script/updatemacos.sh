#!/bin/sh
source utils.sh

updateMacOS()
{
    #upgrade software installed via AppStore
    echo "${GREEN}Updating System Software installed by Apple${NC}"

    # Download OS updates
    sudo softwareupdate -d -r

    # Update only Safari - OS Update must be initialized manually
    sudo softwareupdate -i --safari-only
}