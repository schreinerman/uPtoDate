#!/bin/sh

GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m\n' # No Color

echo_green()
{
    echo $GREEN$@$NC
}

echo_red()
{
    echo $RED$@$NC
}