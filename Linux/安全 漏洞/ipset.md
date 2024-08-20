
# 作用

结合`iptables`,用于存储和操作 IP 地址、网络和端口。

> ipset 重启会清空，需要实现本地存储与开机加载

# USAGE

##  create

```bash
# 创建特定格式的集合
ipset create SET_NAME SET_TYPE
# SET_TYPE 集合类型 METHOD:DATATYPE
# ------------------------
# METHOD:
# hash 
# bitmap 使用固定大小的存储
# list 使用固定大小的存储
# ------------------------
# DATATYPE:可多种组合
# net 网段
# ip  单个ip
# port 支持指定 TCP/UDP 协议
# mac
# iface
# ------------------------

```
## add

```bash
ipset add SET_NAME ENTRY
```
> 子命令
> timeout second  # 超时秒数


## list

```bash
ipset list  # 列出所有集合
ipset list SET_NAME  # 列出集合下元素
```

## destroy

```bash
ipset destroy SET_NAME  # 删除集合
```

## flush

```bash
ipset flush  # 清空所有
ipset flush SET_NAME  # 清空单个集合

```
## del

```bash
iptable del SET_NAME ENTRY  # 删除集合内特定元素
```

## save 持久化

```
ipset save > /etc/ipset
```
## restore  恢复

```bash
ipset restore < xxx
ipset resore -file xxx.conf
```

# 示例

```bash
# 端口
ipset create set-p bitmap:port range 1024-4096
ipset add set-p 2000
ipset add set-p udp:2000  # it's already added  指定包类型在这里无效
ipset add set-p 100  # 加不进去

```

```bash
# ip:port
ipset create test hash:ip,port
ipset add test 192.168.1.0/24,80−82
ipset add test 192.168.1.1,udp:53
ipset add test 192.168.1.1,vrrp:0
ipset test test 192.168.1.1,80
# Warning: 192.168.1.1,80 is in set test.

```

## 只允许国内网段访问

### 网段获取

[IPdeny IP country blocks](https://www.ipdeny.com/)

```bash
wget https://www.ipdeny.com/ipblocks/data/countries/cn.zone
curl -LO http://www.ipdeny.com/ipblocks/data/countries/cn.zone

```


### 创建国内ip网段集合

```bash
pset create china hash:net
```
### ipset导入国内网段

```bash
# 下载并移动
curl -LO http://www.ipdeny.com/ipblocks/data/countries/cn.zone && mv ./cn.zone ~
# 清空
ipset flush china
# 添加
for i in `cat cn.zone`; do 
	ipset add china $i 
done
```
### iptables 实现仅允许国内ip访问

```bash
# 国内ip允许访问80端口tcp服务
iptables -I INPUT -m set --match-set cnip src -p tcp --dport 80 -j ACCEPT
```

### 定时任务

```bash
echo “0 2 * * * root /bin/bash /root/shell/脚本位置.sh” >> /etc/crontab
```
