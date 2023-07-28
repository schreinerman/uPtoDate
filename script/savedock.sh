#!/bin/sh
source utils.sh

saveDock()
{
    defaults export com.apple.dock "/tmp/simpleupdate.dock"
}

restoreDock()
{
    defaults import com.apple.dock "/tmp/simpleupdate.dock"
    killall Dock
}