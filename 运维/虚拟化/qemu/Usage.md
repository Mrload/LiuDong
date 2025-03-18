
> cpu内存参数：`-accel tcg,thread=multi -smp 4,cores=4,threads=1,sockets=1 -m 4096M`
> `-nographic`，不会出现QEMU窗口
> `-serial stdio`，串口重定向到qemu命令行。使用`-nographic`时，不用重复次选项


# qemu-img

> `create` 创建空白硬盘
> 	-f 指定硬盘类型
> 		qcow2  支持压缩和加密
> 		qcow
> 		raw  一次性分配空间，空间足够的话，理论上性能最好


```bash
qemu-img create -f qcow2 alpine_disk 8G

```

# qemu-system-xxx

 `-machine help`
----

>  支持的机器列表
>  模拟器运行时必须选择一个具体的设备，比如运行树梅派3B则执行qemu-system-aarch64 -machine raspi3b或qemu-system-aarch64 -M raspi3b，运行Quard Star board则是执行qemu-system-riscv64 -machine quard-star或qemu-system-aarch64 -M quard-star。qemu定义使用virt来进行通用模拟而非实际的某SOC。
>  具体到设备本身可能还有额外的参数作为可选项供使用者配置，要查看设备的可选参数可以使用-machine ‘id’,help，
```powershell
qemu-system-aarch64 -M help

Supported machines are:
...
# 树莓派
raspi0               Raspberry Pi Zero (revision 1.2)
raspi1ap             Raspberry Pi A+ (revision 1.1)
raspi2b              Raspberry Pi 2B (revision 1.1)
raspi3ap             Raspberry Pi 3A+ (revision 1.0)
raspi3b              Raspberry Pi 3B (revision 1.2)
# 通用 ARM6 ARM7 ARM8
virt-6.0             QEMU 6.0 ARM Virtual Machine
virt-6.1             QEMU 6.1 ARM Virtual Machine
virt-6.2             QEMU 6.2 ARM Virtual Machine
virt-7.0             QEMU 7.0 ARM Virtual Machine
virt-7.1             QEMU 7.1 ARM Virtual Machine
virt-7.2             QEMU 7.2 ARM Virtual Machine
virt                 QEMU 8.0 ARM Virtual Machine (alias of virt-8.0)
virt-8.0             QEMU 8.0 ARM Virtual Machine
...


```

`-cpu help`
----

> 支持的cpu列表

```powershell
qemu-system-aarch64.exe -cpu help

Available CPUs:
  a64fx
  ...
  arm946
  cortex-a7
  ...
```

`-device help`
----
> 支持的设备列表
```powershell
Controller/Bridge/Hub devices:
USB devices:
Storage devices:
Network devices:
Input devices:
Display devices:
Sound devices:
Misc devices:
Watchdog devices:
Uncategorized devices:

```

`-M` `-machine` 选择仿真机器
----

`-cpu` 选择CPU
----

`-smp`  CPU参数
----

> `-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]`
>	n: 虚拟CPU(vcpu)的个数，每个thread都视为一个虚拟CPU
>	sockets:CPU插槽数目，也就是CPU的个数
>	threads： 每个CPU核心拥有的线程数目
>	cores: 每个CPU拥有的CPU核心数目
>	maxcpus: 根据文档，是设置可热插拔的CPU数量，经测试，n的值不可超过maxcpus
>	总的cores数目=cores x sockets，总的threads数目=总的cores数目 x threads

`-accel` 选择加速器
----

>tcg
>TCG模式下可以仅通过软件就可以模拟出在真实机器上的运行效果。无需真实的硬件资产就能部署开发验证环境

`-m` 内存
----

>`-m [size=]megs[,slots=n,maxmem=size]`

`-device` 添加设备，基于驱动
----
>`-device driver[,prop[=value][,...]]`
> 有些设备需要匹配host上的真实设备驱动模拟，一般要匹配类似chardev\audiodev\fsdev\netdev。





`-driver` 添加驱动，一般用于块设备
----

>`-drive if=none,format=raw,file=./usb.img,id=usb0`
>一般来讲必须要配置file参数，qemu会根据文件内容自动匹配format，但是最好还是显式声明format=raw更好，qemu支持的format非常多，甚至包括ftp、http等网络地址，详细可以查阅[qemu文档-磁盘映像](https://www.qemu.org/docs/master/system/images.html)，我们最简单透明的就是直接使用raw格式。if参数用来指定匹配设备内部的块设备

`-netdev` 网络设备
----
>网络设备配置常见两种，一种是user模式，一种是tap模式
### user模式
```bash
-netdev \
user,\
net=192.168.31.0/24,\
host=192.168.31.2,\
hostname=qemu,\
dns=192.168.31.56,\
tftp=$SHELL_FOLDER/output,\
bootfile=/linux_kernel/Image,\
dhcpstart=192.168.31.100,\
hostfwd=tcp::3522-:22,\
hostfwd=tcp::3580-:80,\
id=net0
```
- net=192.168.31.0/24 ：配置网关地址/子网掩码
- host=192.168.31.2 ：配置主机地址
- hostname=qemu ：配置主机名称
- dns=192.168.31.56 ：创建一个dns服务器
- tftp=$SHELL_FOLDER/output,bootfile=/linux_kernel/Image：创建一个tftp服务器
- dhcpstart=192.168.31.100：dhcp地址分配起始地址
- hostfwd=tcp::3522-:22：端口转发将客户机的22端口转发到宿主机的3522端口
>user模式的缺点是客户机无法支持全部的ip协议，但其使用简单，无需对宿主机进行额外的配置。

### tap模式

>tap即在宿主机上创建一个虚拟网卡设备tap0，客户机使用这个网卡设备进行网络通信，优点是对于客户机网卡设备与真实网卡相似，但是缺点是宿主机需要额外工具进行大量配置，网络拓扑结构复杂。

> NOTE:一般情况下的无线网卡sta是不支持网桥的，因此tap方式只能和有线网卡桥接。

>网桥一般需要手动配置，不过qemu提供了一个qemu-bridge-helper工具可以自动配置网桥，需要配置echo “allow br0” > /etc/qemu/bridge.conf文件，启动qemu参数如下：
```bash
-netdev tap,helper=/libexec/qemu-bridge-helper,id=net0
```
>不过如此使用需要qemu使用root权限才能创建网桥，如此对整个qemu提高权限非常不合适，这里我还是建议自己配置网桥后使用如下命令启动qemu。
```bash
-netdev tap,ifname=tap0,script=no,downscript=no,id=net0
```

> 网桥配置脚本
```bash
USER_NAME=$(whoami)
ETH_NAME=enp2s0f0 #eth0

config_tap()
{
    brctl addbr br0
    ip addr flush dev $ETH_NAME
    brctl addif br0 $ETH_NAME
    tunctl -t tap0 -u $USER_NAME
    brctl addif br0 tap0
    ifconfig $ETH_NAME up
    ifconfig tap0 up
    ifconfig br0 up
    ip addr flush dev br0
    ip addr flush dev tap0
    ip addr flush dev $ETH_NAME

    # static
    ip addr add 169.254.105.176/16 broadcast 169.254.255.255 dev br0
    # dynamic
    #dhclient -v br0
}

release_tap()
{
    brctl delif br0 tap0
    tunctl -d tap0
    brctl delif br0 $ETH_NAME
    ifconfig br0 down
    brctl delbr br0
    ifconfig $ETH_NAME up

    # static
    ip addr add 169.254.105.176/16 broadcast 169.254.255.255 dev $ETH_NAME
    # dynamic
    #dhclient -v $ETH_NAME
}
```

```powershell
qemu-system-aarch64 `
-m 4000 `
-cpu cortex-a72 `
-smp 4,cores=4,threads=1,sockets=1 `
-M virt `
-bios QEMU_EFI.fd `
-net nic `
-net tap,ifname=tap1212 `
-device VGA `
-device nec-usb-xhci `
-device usb-kbd `
-device usb-mouse `
-device virtio-scsi-device `
-device scsi-cd,drive=cdrom `
-device virtio-blk-device,drive=hd0 `
-drive if=none,file=alpine_disk,id=hd0 `
-drive if=none,file=alpine-standard-3.20.2-aarch64.iso,id=cdrom,media=cdrom `

```

```bash
qemu-system-aarch64 \
-m 4000 \
-cpu cortex-a72 \
-smp 4,cores=4,threads=1,sockets=1 \
-M virt \
-bios F:\QEMU\QEMU_EFI.fd \
-net nic \
-net tap,ifname=tap1212 \
-device nec-usb-xhci \
-device usb-kbd \
-device usb-mouse \
-device VGA \
-drive if=none,file=xxx.iso,id=cdrom,media=cdrom \
-device virtio-scsi-device \
-device scsi-cd,drive=cdrom \
-drive if=none,file=xxx.img,id=hd0 \
-device virtio-blk-device,drive=hd0


```
> INFO

+ -m 4000 表示分配给虚拟机的内存最大4000MB，可以直接使用 -m 4G
+ -cpu cortex-a72 指定CPU类型，还可以选择cortex-a53、cortex-a57等
+ -smp 4,cores=4,threads=1,sockets=1 指定虚拟机最大使用的CPU核心数等
+ -M virt 指定虚拟机类型为virt，具体支持的类型可以使用 qemu-system-aarch64 -M help 查看
+ -bios F:\QEMU\QEMU_EFI.fd 指定UEFI固件文件
+ -net tap,ifname=tap1212 启用网络功能（ifname=tap1212中的tap1212请修改为前面步骤中自己修改后的网卡名称）
+ -device nec-usb-xhci -device usb-kbd -device usb-mouse 启用USB鼠标等设备
+ -device VGA 启用VGA视图，对于图形化的Linux这条很重要！
+ -drive if=none,file=F:\QEMU\openEuler-20.03-LTS-SP3-aarch64-dvd.iso,id=cdrom,media=cdrom 指定光驱使用镜像文件
+ -device virtio-scsi-device -device scsi-cd,drive=cdrom 指定光驱硬件类型
+ -drive if=none,file=F:\QEMU\openEuler-20.03-LTS-SP3-aarch64.img 指定硬盘镜像文件



```