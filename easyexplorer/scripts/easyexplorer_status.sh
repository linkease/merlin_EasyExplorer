#! /bin/sh

easyexplorer_status=`ps | grep -w easy-explorer | grep -cv grep`
easyexplorer_pid=`ps | grep -w easy-explorer | grep -v grep | awk '{print $1}'`
easyexplorer_version=`/koolshare/bin/easy-explorer -v`
if [ "$easyexplorer_status" == "1" ];then
    echo EasyExplorer $easyexplorer_version 进程运行正常！（PID：$easyexplorer_pid） > /tmp/.easyexplorer.log
else
    echo EasyExplorer $easyexplorer_version 【警告】：进程未运行！ > /tmp/.easyexplorer.log
fi
echo XU6J03M6 >> /tmp/.easyexplorer.log
sleep 2
rm -rf /tmp/.easyexplorer.log