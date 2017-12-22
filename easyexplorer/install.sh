#!/bin/sh
source /koolshare/scripts/base.sh
MODULE=easyexplorer
VERSION="0.0.2"
cd /tmp
cp -rf /tmp/easyexplorer/bin/* /koolshare/bin/
cp -rf /tmp/easyexplorer/scripts/* /koolshare/scripts/
cp -rf /tmp/easyexplorer/webs/* /koolshare/webs/
cp -rf /tmp/easyexplorer/res/* /koolshare/res/

chmod a+x /koolshare/bin/easy-explorer
chmod a+x /koolshare/scripts/easyexplorer_config.sh
chmod a+x /koolshare/scripts/easyexplorer_status.sh
chmod a+x /koolshare/scripts/uninstall_easyexplorer.sh
ln -sf /koolshare/scripts/easyexplorer_config.sh /koolshare/init.d/S99easyexplorer.sh
dbus set easyexplorer_version="${VERSION}"
dbus set softcenter_module_easyexplorer_install=1
dbus set softcenter_module_easyexplorer_name=${MODULE}
dbus set softcenter_module_easyexplorer_title="EasyExplorer文件同步"
dbus set softcenter_module_easyexplorer_description="EasyExplorer 跨设备文件同步+DLNA流媒体。"
dbus set softcenter_module_easyexplorer_version=`dbus get easyexplorer_version`
rm -rf /tmp/easyexplorer* >/dev/null 2>&1
ee_en=`dbus get easyexplorer_enable`
if [ "${ee_en}"x = "1"x ];then
    /koolshare/scripts/easyexplorer_config.sh
fi
logger "[软件中心]: 完成easyexplorer安装"
exit