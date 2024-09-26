
# selinux原因问题，解决

## 关闭服务[临时生效]

`226 transfer done but failed to open directory`

`setenforce 0`  暂时关闭selinux服务

## 开启selinux权限

VSFTPD是一个FTP服务器程序，然后SELinux是CentOS的防火墙组件。由于 vsftpd 默认被 SELinux 拦截，所以会遇到的FTP以下的问题：

1. 226 Transfer done (but failed to open directory).（传输完成，但是打开路径失败）

2. 550 Failed to change directory（更改路径失败）

3. 553 Could not create file.

4. 或者干脆在发送了LIST命令以后，服务器没响应，超时断开。

遇到这样的问题，通常是vsftpd 没有足够的权限，很有可能是被SELinux阻止了。



```bash
getsebool -a | grep ftp

`#以下是显示出来的权限，off是关闭权限，on是打开权限`

`allow_ftpd_anon_write --> off`

`allow_ftpd_full_access --> off`

`allow_ftpd_use_cifs --> off`

`allow_ftpd_use_nfs --> off`

`ftpd_connect_db --> off`

`ftpd_use_passive_mode --> off`

`ftp_home_dir --> off`

```

其中，ftp_home_dir和allow_ftpd_full_access必须为on 才能使vsftpd 具有访问ftp根目录，以及文件传输等权限。

设置命令：`setsebool -p xxxxxx on`

```bash
setsebool -P allow_ftpd_full_access on

setsebool -P ftp_home_dir on
```