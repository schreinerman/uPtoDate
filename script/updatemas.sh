#!/bin/sh
source utils.sh

updateMAS()
{
    #upgrade software installed via AppStore
    echo "${GREEN}Updating Software installed by Apple App Store${NC}"
    mas upgrade
}