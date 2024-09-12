
# 配置

## windows下`$ENV:HOMEPATH\.wslconfig`

> wslconfig文件为所有使用WSL 2运行的Linux发行版全局配置设置。
> 配置后`wsl --shutdown`,等个十几秒吧

| key                     | value   | default                                                    | notes                                                                                                                                                                                                   |
| ----------------------- | ------- | ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `kernel`                | path    | The Microsoft built kernel provided inbox                  | An absolute Windows path to a custom Linux kernel.                                                                                                                                                      |
| `memory`                | size    | 50% of total memory on Windows                             | How much memory to assign to the WSL 2 VM.                                                                                                                                                              |
| `processors`            | number  | The same number of logical processors on Windows           | How many logical processors to assign to the WSL 2 VM.                                                                                                                                                  |
| `localhostForwarding`   | boolean | `true`                                                     | Boolean specifying if ports bound to wildcard or localhost in the WSL 2 VM should be connectable from the host via `localhost:port`.                                                                    |
| `kernelCommandLine`     | string  | Blank                                                      | Additional kernel command line arguments.                                                                                                                                                               |
| `safeMode`              | boolean | `false`                                                    | Run WSL in "Safe Mode" which disables many features and is intended to be used to recover distributions that are in bad states. Only available for Windows 11 and WSL version 0.66.2+.                  |
| `swap`                  | size    | 25% of memory size on Windows rounded up to the nearest GB | How much swap space to add to the WSL 2 VM, 0 for no swap file. Swap storage is disk-based RAM used when memory demand exceeds limit on hardware device.                                                |
| `swapFile`              | path    | `%USERPROFILE%\AppData\Local\Temp\swap.vhdx`               | An absolute Windows path to the swap virtual hard disk.                                                                                                                                                 |
| `pageReporting`         | boolean | `true`                                                     | Default `true` setting enables Windows to reclaim unused memory allocated to WSL 2 virtual machine.                                                                                                     |
| `guiApplications`       | boolean | `true`                                                     | Boolean to turn on or off support for GUI applications ([WSLg](https://github.com/microsoft/wslg)) in WSL.                                                                                              |
| `debugConsole`*         | boolean | `false`                                                    | Boolean to turn on an output console Window that shows the contents of `dmesg` upon start of a WSL 2 distro instance. Only available for Windows 11.                                                    |
| `nestedVirtualization`* | boolean | `true`                                                     | Boolean to turn on or off nested virtualization, enabling other nested VMs to run inside WSL 2. Only available for Windows 11.                                                                          |
| `vmIdleTimeout`*        | number  | `60000`                                                    | The number of milliseconds that a VM is idle, before it is shut down. Only available for Windows 11.                                                                                                    |
| `dnsProxy`              | boolean | `true`                                                     | Only applicable to networkingMode = NAT. Boolean to inform WSL to configure the DNS Server in Linux to the NAT on the host. Setting to false will mirror DNS servers from Windows to Linux.             |
| `networkingMode`**      | string  | `NAT`                                                      | If the value is `mirrored` then this turns on mirrored networking mode. Default or unrecognized strings result in NAT networking.                                                                       |
| `firewall`**            | boolean | `true`                                                     | Setting this to true allows the Windows Firewall rules, as well as rules specific to Hyper-V traffic, to filter WSL network traffic.                                                                    |
| `dnsTunneling`**        | boolean | `true`                                                     | Changes how DNS requests are proxied from WSL to Windows                                                                                                                                                |
| `autoProxy`*            | boolean | `true`                                                     | Enforces WSL to use Windows’ HTTP proxy information                                                                                                                                                     |
| `defaultVhdSize`        | size    | `1099511627776` (1TB)                                      | Set the Virtual Hard Disk (VHD) size that stores the Linux distribution (for example, Ubuntu) file system. Can be used to limit the maximum size that a distribution file system is allowed to take up. |



# DNS隧道使用windows代理

## windows下`~/.wslconfig`配置
```bash
[wsl2]
networkingMode=mirrored
dnsTunneling=true
```