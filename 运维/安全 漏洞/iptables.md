# 四表五链 堵通策略

| 表      | 链                                           |
| ------ | ------------------------------------------- |
| filter | INPUT、FORWARD、OUTPUT                        |
| 源码     | PREROUTING、OUTPUT                           |
| mangle | PREROUTING、INPUT、FORWARD、OUTPUT、POSTROUTING |
| nat    | PREROUTING、INPUT、OUTPUT、POSTROUTING         |

## “四表”是指，iptables的功能——filter, nat, mangle, raw.

+ filter, 控制数据包是否允许进出及转发（INPUT、OUTPUT、FORWARD）,可以控制的链路有input, forward, output

+ nat, 控制数据包中地址转换，可以控制的链路有prerouting, input, output, postrouting

+ mangle,修改数据包中的原数据，可以控制的链路有prerouting, input, forward, output, postrouting

+ raw,控制nat表中连接追踪机制的启用状况，可以控制的链路有prerouting, output

## “五链”是指内核中控制网络的NetFilter定义的五个规则链，分别为:

+ PREROUTING, 路由前

+ INPUT, 数据包流入口

+ FORWARD, 转发管卡

+ OUTPUT, 数据包出口

+ POSTROUTING, 路由后

## 堵通策略是指对数据包所做的操作

一般有两种操作——“通（ACCEPT）”、“堵（DROP）”，还有一种操作很常见REJECT。

```bash
ACCEPT（允许）、DROP（丢弃）、REJECT（拒绝）、RETURN（返回）
```



# 数据包走向

![img](数据包走向.webp)

# 命令

![](iptables命令参数)

## 语法规则

```bash
# iptables [-t table] COMMAND [chain] CRETIRIA -j ACTION

# -t table，是指操作的表，filter、nat、mangle或raw, 默认使用filter

# COMMAND，子命令，定义对规则的管理

# chain, 指明链路

# CRETIRIA, 匹配的条件或标准

# ACTION,操作动作
```

+ 不允许10.8.0.0/16网络对80/tcp端口进行访问：

```bash
iptables -A INPUT -s 10.8.0.0/16 -d 172.16.55.7 -p tcp --dport 80 -j DROP
```

## 链管理

```bash
# -N, --new-chain chain：新建一个自定义的规则链；

# -X, --delete-chain [chain]：删除用户自定义的引用计数为0的空链；

# -F, --flush [chain]：清空指定的规则链上的规则；

# -E, --rename-chain old-chain new-chain：重命名链；

# -Z, --zero [chain [rulenum]]：置零计数器；

# -P, --policy chain target， 设置链路的默认策略
```

## 规则管理

```bash
# -A, --append chain rule-specification：追加新规则于指定链的尾部；

# -I, --insert chain [rulenum] rule-specification：插入新规则于指定链的指定位置，默认为首部；

# -R, --replace chain rulenum rule-specification：替换指定的规则为新的规则；

# -D, --delete chain rulenum：根据规则编号删除规则；
```

## 查看规则

```bash
# -L, --list [chain]：列出规则；

# -v, --verbose：详细信息；

# -vv， -vvv 更加详细的信息

# -n, --numeric：数字格式显示主机地址和端口号；

# -x, --exact：显示计数器的精确值；

# -–line-numbers：列出规则时，显示其在链上的相应的编号；

# -S, --list-rules [chain]：显示指定链的所有规则；
```

+ 例子

```bash
# iptables -nvL INPUT  --line-numbers
Chain INPUT【链路】 (policy ACCEPT【默认规则】 0 packets【经过的数据包数量】, 0 bytes【字节数】)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 ACCEPT     udp  --  virbr0 *       0.0.0.0/0            0.0.0.0/0            udp dpt:53
2        0     0 ACCEPT     tcp  --  virbr0 *       0.0.0.0/0            0.0.0.0/0            tcp dpt:53
3        0     0 ACCEPT     udp  --  virbr0 *       0.0.0.0/0            0.0.0.0/0            udp dpt:67
4        0     0 ACCEPT     tcp  --  virbr0 *       0.0.0.0/0            0.0.0.0/0            tcp dpt:67
5      193  228K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
6        0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0           
7      567 42187 INPUT_direct  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
8      567 42187 INPUT_ZONES_SOURCE  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
9      567 42187 INPUT_ZONES  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
10       0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
11     567 42187 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

# 列解释
# pkts: 每个规则所过滤过的数据包数量，
...
```

## 匹配条件

匹配条件包括通用匹配条件和扩展匹配条件。

通用匹配条件是指针对源地址、目标地址的匹配，包括单一源IP、单一源端口、单一目标IP、单一目标端口、数据包流经的网卡以及协议。

扩展匹配条件指通用匹配之外的匹配条件。

### 通用匹配条件

```bash
[!] -s, --source address[/mask][,…]：检查报文的源IP地址是否符合此处指定的范围，或是否等于此处给定的地址；
[!] -d, --destination address[/mask][,…]：检查报文的目标IP地址是否符合此处指定的范围，或是否等于此处给定的地址；
[!] -p, --protocol protocol：匹配报文中的协议，可用值tcp, udp, udplite, icmp, icmpv6,esp, ah, sctp, mh 或者 “all”, 亦可以数字格式指明协议；
[!] -i, --in-interface name：限定报文仅能够从指定的接口流入网卡；仅用于进入INPUT、FORWARD和PREROUTING链的数据包。
[!] -o, --out-interface name：限定报文仅能够从指定的接口流出网卡；用于进入FORWARD、OUTPUT和POSTROUTING链的数据包。
```

### 扩展匹配条件

#### 隐含扩展匹配条件

```
-p tcp：可直接使用tcp扩展模块的专用选项；
　　[!] --source-port,--sport port[:port] 匹配报文源端口；可以给出多个端口，但只能是连续的端口范围 ；
　　[!] --destination-port,--dport port[:port] 匹配报文目标端口；可以给出多个端口，但只能是连续的端口范围 ；
　　[!] --tcp-flags mask comp 匹配报文中的tcp协议的标志位；标志是:SYN, ACK, FIN, RST, URG, PSH, ALL, NONE;
　　　　mask：要检查的FLAGS list，以逗号分隔；
　　　　comp：在mask给定的诸多的FLAGS中，其值必须为1的FLAGS列表，余下的其值必须为0；
　　[!] --syn： --tcp-flags SYN,ACK,FIN,RST SYN

-p udp：可直接使用udp协议扩展模块的专用选项：
　　[!] --source-port,--sport port[:port]
　　[!] --destination-port,--dport port[:port]
　　
-p icmp
　　[!] --icmp-type {type[/code]|typename}
```

#### 显式扩展匹配条件

必须用-m option选项指定扩展匹配的类型，常见的

##### mac

+ mac地址过滤

```bash
--mac-source 匹配来源mac

```





##### multiport 

+ 以离散或连续的 方式定义多端口匹配条件，最多15个。

```bash
[!] --source-ports,–sports port[,port|,port:port]…：指定多个源端口；

[!] --destination-ports,–dports port[,port|,port:port]…：指定多个目标端口；
```

```bash
iptables -I INPUT -d 172.16.0.7 -p tcp -m multiport --dports 22,80,139,445,3306 -j ACCEPT
# 本机IP 172.16.0.7
# 开放22 80 139 445 3306 端口
```

##### iprange

+ 以连续地址块的方式来指明多IP地址匹配条件。

```bash
[!] --src-range from[-to]

[!] --dst-range from[-to]
```

```bash
iptables -I INPUT -d 172.16.0.7 -p tcp -m multiport --dports 22,80,139,445,3306 -m iprange --src-range 172.16.0.61-172.16.0.70 -j REJECT
# 向 172.16.0.61至70这几个IP开放22 80 139 445 3306 端口
```

##### time

+ 匹配数据包到达的时间

```bash
–timestart hh:mm[:ss]

–timestop hh:mm[:ss]

    [!] --weekdays day[,day…]

    [!] --monthdays day[,day…]

–datestart YYYY[-MM[-DD[Thh[:mm[:ss]]]]]

–datestop YYYY[-MM[-DD[Thh[:mm[:ss]]]]]

–kerneltz：使用内核配置的时区而非默认的UTC；
```

##### string

+ 匹配数据包中的字符

```bash
–algo {bm|kmp}

[!] --string pattern

[!] --hex-string pattern

–from offset

–to offset
```

```bash
iptables -I OUTPUT -m string --algo bm --string "xxx" -j REJECT
```

##### connlimit

+ 用于限制同一IP可建立的连接数目

```bash
–connlimit-upto n

–connlimit-above n
```

```bash
iptables -I INPUT -d 172.16.0.7 -p tcp --syn --dport 22 -m connlimit --connlimit-above 2 -j REJECT
```

##### limit

+ 限制收发数据包的速率

```bash
–limit rate[/second|/minute|/hour|/day]

–limit-burst number
```

```bash
iptables -I OUTPUT -s 172.16.0.7 -p icmp --icmp-type 0 -j ACCEPT

```



##### state

+ 限制收发包的状态

```bash
[!] --state state

INVALID, ESTABLISHED, NEW, RELATED or UNTRACKED.

NEW: 新连接请求；

ESTABLISHED：已建立的连接；

INVALID：无法识别的连接；

RELATED：相关联的连接，当前连接是一个新请求，但附属于某个已存在的连接；

UNTRACKED：未追踪的连接；

```
```bash
# 一旦限制外网访问，又想要去访问外网
# 允许已建立和相关的包进入
# 可以ping别人，不能被ping
iptables -I INPUT -m state --state RELATED,ESTABLELISHED -j ACCEPT
```

```bash
state扩展：
内核模块装载：
　　nf_conntrack
　　nf_conntrack_ipv4

手动装载：
　　nf_conntrack_ftp

追踪到的连接：
　　/proc/net/nf_conntrack

调整可记录的连接数量最大值：
　　/proc/sys/net/nf_conntrack_max

超时时长：
　　/proc/sys/net/netfilter/timeout
```
# 示例

## 拒绝所有外网

```bash
# 远程慎用，最好别放第一个规则 INPUT后跟number避免放第一个
iptables -I INPUT -j DROP
```
	- 仅此规则时
	- 任何交互都不能做，即使是localhost
## 开放本地环回

```bash
# 放在前面, -i 指定网卡
iptables -I INPUT -i lo -j ACCEPT
```
	- 可以联通 `127.0.0.1`、`localhost`或`本机在局域网的地址`
	
# 常用规则

### 清空规则

```bash
iptables -F
# 清除所有规则来暂时停止防火墙
# !!!这只适合在没有配置防火墙的环境中，如果已经配置过默认规则为deny的环境，此步骤将使系统的所有网络访问中断
```

###  只能收发邮件，别的都关闭

```bash
# 只能
iptables -I Filter -m mac –mac-source 00:0F:EA:25:51:37 -j DROP
iptables -I Filter -m mac –mac-source 00:0F:EA:25:51:37 -p udp --dport 53 -j ACCEPT
iptables -I Filter -m mac –mac-source 00:0F:EA:25:51:37 -p tcp --dport 25 -j ACCEPT
iptables -I Filter -m mac –mac-source 00:0F:EA:25:51:37 -p tcp --dport 110 -j ACCEPT
```



# 测试

## 一个新的虚拟机

+ 桥接

+ IP为192.168.4.22

## 安装docker,用于各类端口测试

##  开启iptables服务

+ 关闭防火墙

```bash
systemnctl stop firewalld
```

+ 安装 启动 iptables服务

```bash
yum install iptables-services
systemctl start iptables
```

## 部署为生成环境

+ 生产环境基本需求

  让内网的Ip全部通过，外网IP添加到白名单，其他一切拒绝

### 清空所有重新配置

```bash
iptables -F      #清空所有的防火墙规则

iptables -X      #删除用户自定义的空链,这里会把docker配置的链都清空，需要重启docker服务能重新生成

iptables -Z      #清空计数
```

### 配置允许ssh访问

```bash
iptables -A INPUT -s 192.168.4.0/24 -p tcp --dport 22 -j ACCEPT
```

### 允许本地回环可以正常使用

+ 为了127.0.0.1可以正常使用

```bash
iptables -A INPUT -i lo -j ACCEPT

iptables -A OUTPUT -o lo -j ACCEPT
```

## 设置默认的规则

+ 默认INPUT 、FORWARD都禁止了，OUTPUT允许

```bash
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
```

## 开启各类对外端口

+ 使用docker在80端口运行nginx默认http服务，81端口开启了一个ssh转发【转发至192.168.4.5:22端口】
+ 82端口使用python启动一个本地的http服务

```bash
iptables -A INPUT -p tcp --dport 80:82 -j ACCEPT
```

### 允许被ping

```bash
iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT #允许被ping
```

### 【没能彻底理解的】已经建立的连接得让它进来

```bash
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# ESTABLISHED：已建立的连接；
# RELATED：相关联的连接，当前连接是一个新请求，但附属于某个已存在的连接；
# 如果不加这一个规则，数据包回不来，服务器没办法上外网
```

### 另一种

```bash
# 将filter表的INPUT默认规则设置为ACCEPT
# 然后添加
iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited

# 这一条规则是拒绝所有数据包
# 所以如果有需要通过的数据包，必须将其添加到此行的前面去才行
```

### Docker容器映射的端口没办法通过INPUT链阻止

```bash
# 没仔细研究
# 大体看了一下
# 需要去nat表里处理相应的规则
```

# 内部服务器配置

```bash
# 添加白名单,完全开放
iptables -I INPUT -s 远程HOST -j ACCEPT

# 阻止所有机器访问本机 
iptables -I INPUT 2 -j DROP

# 

```





