#!/bin/sh
source utils.sh
source fixpermissions.sh

updatePythonVersion()
{
    PYTON_VERSION=$1
    PIP="$PYTHON -m pip"
    if [ "$(command -v "pip$PYTON_VERSION")" ]
    then
        PIP="$(which pip$PYTON_VERSION)"
    fi
    PYTHON="python$PYTON_VERSION"
    if [ "$(command -v $PIP)" ]
    then
        printf "${GREEN}Updating python $PYTON_VERSION packages...${NC}"
        fixPermissions
        $PYTHON -m pip uninstall -y pip || true
        $PYTHON -m pip install --user --upgrade pip || true
        $PYTHON -m pip install --upgrade --force-reinstall pip || true
        $PYTHON -m ensurepip --upgrade
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
