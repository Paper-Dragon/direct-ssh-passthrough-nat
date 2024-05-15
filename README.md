# pass through NAT network

## Script Install

### get install scripts

```bash
wget https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_install.sh
```

### run install script

#### default

```bash
chmod +x frpc_linux_install.sh
./frpc_linux_install.sh
```

#### no spy mode

```bash
chmod +x frpc_linux_install.sh
SPY_MODE=False ./frpc_linux_install.sh
```

## Script Uninstall

### get uninstall script

```bash
wget https://gitee.com/PaperDragon/direct-ssh-passthrough-nat/raw/master/frpc_linux_uninstall.sh
```

### run uninstall script

#### default mode

```bash
chmod +x frpc_linux_uninstall.sh
./frpc_linux_uninstall.sh
```

#### no spy mode

```bash
chmod +x frpc_linux_uninstall.sh
SPY_MODE=False ./frpc_linux_uninstall.sh
```

## Docker support

```bash
docker run -itd --ipc=host \
    --pid=host \
    -v /:/host \
    jockerdragon/frpc-ssh-passthrough:latest
```
