#!/bin/sh

kaceIndex()
{
    if [ -f "/Library/Application Support/Quest/KACE/bin/runkbot" ]
    then
        echo "${GREEN}Executing KACE Inventory${NC}"
        sudo /Library/Application\ Support/Quest/KACE/bin/runkbot 2 0
    fi
}