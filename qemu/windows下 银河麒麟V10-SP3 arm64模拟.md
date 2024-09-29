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