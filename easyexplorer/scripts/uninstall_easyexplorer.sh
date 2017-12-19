#!/bin/sh
eval `dbus export easyexplorer_`
source /koolshare/scripts/base.sh
logger "[软件中心]: 正在卸载 EasyExplorer文件同步..."
MODULE=easyexplorer
cd /
/koolshare/scripts/easyexplorer_config.sh stop
rm -f /koolshare/init.d/S99easyexplorer.sh
rm -f /koolshare/scripts/easyexplorer_config.sh
rm -f /koolshare/scripts/easyexplorer_status.sh
rm -f /koolshare/webs/Module_easyexplorer.asp
rm -f /koolshare/res/icon-easyexplorer.png
rm -f /koolshare/res/easyexplorer_check.html
rm -f /koolshare/bin/easy-explorer
rm -f /koolshare/bin/easy-explorer.log
rm -f /koolshare/bin/_ffprobe_cache /koolshare/scripts/_ffprobe_cache
rm -f /tmp/var/run/easy-explorer.pid
rm -fr /tmp/easyexplorer* >/dev/null 2>&1
values=`dbus list easyexplorer | cut -d "=" -f 1`

for value in $values
do
dbus remove $value 
done
logger "[软件中心]: 完成EasyExplorer文件同步 卸载"
rm -f /koolshare/scripts/uninstall_easyexplorer.sh
