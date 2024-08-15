
# qemu-img

> create 创建空白硬盘

```bash
qemu-img create -f qcow2 alpine_disk 8G

```

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

