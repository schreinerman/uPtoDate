#!/bin/sh
source utils.sh

checkInstallMAS()
{
    #check for mas
    if [ ! "$(command -v mas)" ]
    then
        echo "${GREEN}Installing MAS...${NC}"
        brew install mas
    fi
}