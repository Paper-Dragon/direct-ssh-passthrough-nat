#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# fonts color
Green="\033[32m"
Red="\033[31m"
Yellow="\033[33m"
GreenBG="\033[42;37m"
RedBG="\033[41;37m"
Font="\033[0m"
# fonts color

# variable
WORK_PATH=$(dirname $(readlink -f $0))
FRP_NAME=frpc
FRP_VERSION=0.56.0
FRP_PATH=/usr/local/frp

if ! grep -q '/docker/' /proc/1/cgroup; then
    # 停止frpc
    systemctl stop ${FRP_NAME}
    systemctl disable ${FRP_NAME}
    # 删除frpc
    rm -rf ${FRP_PATH}
    # 删除frpc.service
    rm -rf /lib/systemd/system/${FRP_NAME}.service
    systemctl daemon-reload
    # 删除本文件
    #rm -rf ${FRP_NAME}_linux_uninstall.sh
else
  # 如果不在，则查询frpc进程并杀死。
  if pgrep -x 'frpc' > /dev/null; then
    pkill -x 'frpc'
    # 删除frpc
    rm -rf ${FRP_PATH}
  fi
fi


echo -e "${Green}============================${Font}"
echo -e "${Green}卸载成功,相关文件已清理完毕!${Font}"
echo -e "${Green}============================${Font}"
