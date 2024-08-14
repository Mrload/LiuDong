
# qemu-img

> create 创建空白硬盘

```bash
qemu-img create -f qcow2 alpine_disk.qcow2 8G

```

# 启动

```bash
qemu-system-x86_64 -machine q35 \
	-smp 4,sockets=1,cores=4,threads=1 \
	-m 4096 \
	-drive file=alpine_disk.qcow2 \
	-drive file=alpine-standard-3.20.2-aarch64.iso,media=cdrom

```