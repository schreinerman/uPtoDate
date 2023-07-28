#!/bin/sh
source utils.sh

checkXCode()
{
    #check for XCode
    if [ ! "$(command -v xcode-select)" ]; then
        echo "${RED}please install XCode from the AppStore first...${NC}"
        exit 1
    fi
}