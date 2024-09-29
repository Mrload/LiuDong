
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

> `-M` `-machine` 选择仿真机器

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

> `-cpu` 选择CPU

```powershell
qemu-system-aarch64.exe -cpu help

Available CPUs:
  a64fx
  ...
  arm946
  cortex-a7
  ...
```

> `-smp`  CPU参数
> `-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]`

>	n: 虚拟CPU(vcpu)的个数，每个thread都视为一个虚拟CPU
>	sockets:CPU插槽数目，也就是CPU的个数
>	threads： 每个CPU核心拥有的线程数目
>	cores: 每个CPU拥有的CPU核心数目
>	maxcpus: 根据文档，是设置可热插拔的CPU数量，经测试，n的值不可超过maxcpus
>	总的cores数目=cores x sockets，总的threads数目=总的cores数目 x threads

# 安装 qemu-system-xxx

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


>  -machine help
>  支持的机器列表

> -cpu help
> 支持的cpu列表

> -device help
> 支持的设备列表


```