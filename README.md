# pass through NAT network



## install


### spy mode(default)
```bash
apt update
apt install wget -y # if in container
wget -O - https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_install.sh | bash
wget -O - https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_install.sh | SPY_MODE=False bash 
```


## uninstall

```bash
wget -O - https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_uninstall.sh | bash
wget -O - https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_uninstall.sh | SPY_MODE=False bash
```
