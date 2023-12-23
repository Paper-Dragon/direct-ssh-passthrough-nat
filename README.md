# pass through NAT network



## pre

> base environment

```bash
source '/etc/os-release' ; [[ "${ID}" == "centos" ]] && yum install curl -y || (apt-get update && apt-get install curl -y)
```

## install

```bash
bash <(curl -sSL https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_install.sh)
```

## uninstall

```bash
bash <(curl sSL https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_install.sh)
```

