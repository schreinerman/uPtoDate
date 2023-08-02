#!/bin/sh
source utils.sh
source fixpermissions.sh

updatePythonVersion()
{
    PYTON_VERSION=$1
    PIP="pip$PYTON_VERSION"
    PYTHON="python$PYTON_VERSION"
    if [ "$(command -v $PIP)" ]
    then
        echo "${GREEN}Updating python $PYTON_VERSION packages...${NC}"
        fixPermissions
        $PYTHON -m pip uninstall -y pip
        $PYTHON -m pip install --user --upgrade pip
        
        $PIP list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 $PIP install --upgrade --no-cache-dir --use-deprecated=legacy-resolver || true
    fi
}

updatePython()
{
    #update python packages
    updatePythonVersion "2"
    updatePythonVersion ""
    updatePythonVersion "3.11"
    updatePythonVersion "3.10"
    updatePythonVersion "3.9"
    updatePythonVersion "3.8"
    updatePythonVersion "3.7"
    updatePythonVersion "3.6"
    fixPermissions
}
