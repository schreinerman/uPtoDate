#!/bin/sh
source utils.sh
source savedock.sh
source fixpermissions.sh

updateBrew()
{
    fixPermissions
    saveDock
    #upgrade software packages
    echo "${GREEN}Upgrading Brew Packages...${NC}"
    brew upgrade || true
    #upgrade also casks (like Firefox, Chrome, etc.)
    echo "${GREEN}Updating Brew Apps...${NC}"
    brew upgrade --cask --greedy || true
    fixPermissions
    restoreDock
}