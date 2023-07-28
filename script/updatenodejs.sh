#!/bin/sh
source utils.sh
source fixpermissions.sh

updateNodeJs()
{
    fixPermissions
    #updating node packages
    if [ "$(command -v npm)" ]
    then
        echo "${GREEN}Updating node packages...${NC}"
        npm install npm@latest -g
        npm update -g
    fi
}