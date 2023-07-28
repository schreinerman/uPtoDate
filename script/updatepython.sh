#!/bin/sh
source utils.sh
source fixpermissions.sh

updatePython()
{
    #update python packages
    if [ "$(command -v pip3)" ]
    then
        echo "${GREEN}Updating python 3 packages...${NC}"
        fixPermissions
        pip3 list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip3 install --upgrade --no-cache-dir --use-deprecated=legacy-resolver || true
    fi

    if [ "$(command -v python2)" ]
    then
        echo "${GREEN}Updating python 2 packages...${NC}"
        fixPermissions
        python2 -m pip list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 python2 -m pip install --upgrade --no-cache-dir --use-deprecated=legacy-resolver  || true
    fi

    if [ "$(command -v pip)" ]
    then
        echo "${GREEN}Updating python packages...${NC}"
        fixPermissions
        pip list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip install --upgrade --no-cache-dir --use-deprecated=legacy-resolver  || true
    fi

    fixPermissions
}