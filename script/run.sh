#!/bin/bash
source utils.sh
source savedock.sh
source fixpermissions.sh
source checkxcode.sh
source checkinstallbrew.sh
source checkinstallmas.sh
source updatepython.sh
source updatenodejs.sh
source updatebrew.sh
source updatemas.sh
source updatemacos.sh
source kaceindex.sh

pidkeepalive=""

term_handler() {
  echo Exiting...
  kill "$pidkeepalive"
  exit 143; # 128 + 15 -- SIGTERM
}

rootKeepAlive()
{
   timeout=0
   while([ $timeout -lt 60000 ])
   do
      timeout=$(($timeout + 10))
      sudo echo . > /dev/null
      sleep 10
   done
}

trap 'kill ${!}; term_handler' SIGINT SIGKILL SIGTERM SIGQUIT SIGTSTP SIGSTOP SIGHUP

echo Enter admin password:
sudo echo 
rootKeepAlive &
pidkeepalive=$!

fixPermissions
checkXCode
checkInstallBrew
checkInstallMAS

updatePython

updateNodeJs

updateBrew

updateMAS

updateMacOS

kaceIndex

fixPermissions

kill $pidkeepalive
exit 0
