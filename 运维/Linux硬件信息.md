

# CPU

```bash
ls cpu
Architecture:          x86_64  # 架构
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                48  # 逻辑cpu
On-line CPU(s) list:   0-47
Thread(s) per core:    1  # 单个物理cpu线程数
Core(s) per socket:    24  # 单个物理cpu线核心数
Socket(s):             2  # 物理CPU个数
NUMA node(s):          2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 85
Model name:            Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
Stepping:              7
CPU MHz:               1207.031  # 主频
CPU max MHz:           4000.0000
CPU min MHz:           1200.0000
BogoMIPS:              6000.00
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              1024K
L3 cache:              36608K
NUMA node0 CPU(s):     0-23
NUMA node1 CPU(s):     24-47

```

# 内存

```bash
free -g  # 使用情况
              total        used        free      shared  buff/cache   available
Mem:            502          60         322          49         119         391
Swap:             3           1           2

```

```bash
dmidecode -t memory  # 硬件信息
```

# 硬盘

```bash
lsblk
NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda               8:0    0 446.6G  0 disk 
├─sda1            8:1    0   200M  0 part /boot/efi
├─sda2            8:2    0     1G  0 part /boot
└─sda3            8:3    0 445.4G  0 part 
  ├─centos-root 253:0    0 441.4G  0 lvm  /
  └─centos-swap 253:1    0     4G  0 lvm  [SWAP]
sdb               8:16   0  26.2T  0 disk 
└─sdb1            8:17   0  26.2T  0 part /data
sr0              11:0    1  1024M  0 rom
```

# screenfetch

# neofetch


