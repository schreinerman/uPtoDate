#!/bin/bash
source utils.sh

checkInstallBrew()
{
    #check for brew
    if [ ! "$(command -v brew)" ]
    then
        echo "${GREEN}Installing Brew...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}
