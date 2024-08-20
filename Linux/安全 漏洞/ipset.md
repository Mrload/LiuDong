
# 作用

结合`iptables`,用于存储和操作 IP 地址、网络和端口。

# USAGE

##  create

```bash
# 创建特定格式的集合
ipset create SET_NAME SET_TYPE
ipset -N SET_NAME SET_TYPE
# SET_TYPE 集合类型
# hash:ip 表示创建一个使用 IP 地址作为元素的哈希集合。它指定了 ipset 的类型和数据结构，以便有效地存储和检索 IP 地址。冒号前面的部分（hash）表示 ipset 的类型，冒号后面的部分（ip）表示使用的数据类型。
# ------------------------
# hash:ip：使用 IP 地址作为元素的哈希集合。 
# hash:net：使用 IP 网络（CIDR）作为元素的哈希集合。 
# hash:ip,port：使用 IP 地址和端口号组合作为元素的哈希集合。 
# hash:net,port：使用 IP 网络（CIDR）和端口号组合作为元素的哈希集合。
# ------------------------

```
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
# 示例
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
## iptables 实现仅允许国内ip访问

```bash
# 国内ip允许访问80端口tcp服务
iptables -I INPUT -m set --match-set cnip src -p tcp --dport 80 -j ACCEPT
```

## 定时任务

```bash
echo “0 2 * * * root /bin/bash /root/shell/脚本位置.sh” >> /etc/crontab
```
