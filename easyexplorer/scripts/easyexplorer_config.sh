#!/bin/sh
eval `dbus export easyexplorer`
source /koolshare/scripts/base.sh
BIN=/koolshare/bin/easy-explorer
PID_FILE=/var/run/easy-explorer.pid
case $ACTION in
start)
    if [ "$easyexplorer_enable" == "1" ];then
        start-stop-daemon -S -q -b -m -p ${PID_FILE} -x ${BIN} -- -u $easyexplorer_token -share $easyexplorer_dir
    fi
    ;;
*)
    if [ "$easyexplorer_enable" == "1" ];then
        killall easy-explorer
        start-stop-daemon -S -q -b -m -p ${PID_FILE} -x ${BIN} -- -u $easyexplorer_token -share $easyexplorer_dir
    else
        killall easy-explorer
    fi
    ;;
esac