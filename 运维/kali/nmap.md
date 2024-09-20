
# 主机发现

+ iR                                                                随机选择目标

+ -iL                                                                从文件中加载IP地址

-sL                                                               简单的扫描目标

-sn                                                               Ping扫描-禁用端口扫描

-Pn                                                              将所有主机视为在在线，跳过主机发现

-PS[portlist]                                              （TCP SYN ping） 需要root权限

-PA[portlist]                                              （TCP ACK ping）

-PU[portlist]                                              （UDP  ping）

-PY [portlist]                                             （SCTP ping）

-PE/PP/PM                                                 ICMP回显，时间戳和网络掩码请求探测

-PO[协议列表]                                            IP协议Ping

-n/-R                                                           从不执行DNS解析/始终解析[默认：有时]

--dns-servers                                              指定自定义DNS服务器

--system-dns                                              使用OS的dns服务器

--traceroute                                                跟踪到每个主机的跃点路径