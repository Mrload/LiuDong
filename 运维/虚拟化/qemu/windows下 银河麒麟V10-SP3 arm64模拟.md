# aarch64 kylin-v10-sp3

## 安装

```powershell
qemu-system-aarch64.exe `
-m 4G `
-cpu cortex-a72 `
--accel tcg,thread=multi `
-M virt `
-bios QEMU_EFI.fd `
-rtc base=localtime `
-display sdl `
-device VGA `
-device nec-usb-xhci `
-device usb-tablet `
-device usb-kbd `
-drive if=virtio,file=kylin_arm64.img,id=hd0,format=raw,media=disk `
-drive if=none,file=Kylin-Server-V10-SP3-2403-Release-20240426-arm64.iso,id=cdrom,media=cdrom `
-device virtio-scsi-device `
-device scsi-cd,drive=cdrom
```

## 启动

### 网络模式一

> 网络模式
> ssh端口转发？宿主机的2222转发给虚拟机的22

```powershell
qemu-system-aarch64.exe `
-m 8G `
-cpu cortex-a72 `
--accel tcg,thread=multi `
-M virt `
-bios QEMU_EFI.fd `
-rtc base=localtime `
-display sdl `
-device VGA `
-device nec-usb-xhci `
-device usb-tablet `
-device usb-kbd `
-drive if=virtio,file=kylin_arm64.img,id=hd0,format=raw,media=disk `
-net nic,model=virtio `
-net user,hostfwd=tcp::2222-:22
```

### 网络模式二

#TODO:没能成功联网
> 使用虚拟网卡桥接,`tap1212` 这张网卡需要提前创建,并且和上网网卡桥接。

```powershell
qemu-system-aarch64.exe `
-m 8G `
-cpu cortex-a72 `
--accel tcg,thread=multi `
-M virt `
-bios QEMU_EFI.fd `
-rtc base=localtime `
-display sdl `
-device VGA `
-device nec-usb-xhci `
-device usb-tablet `
-device usb-kbd `
-drive if=virtio,file=kylin_arm64.img,id=hd0,format=raw,media=disk `
-net nic `
-net tap,ifname=tap1212
```
