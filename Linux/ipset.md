
# 只允许国内网段访问

## 网段获取

[IPdeny IP country blocks](https://www.ipdeny.com/)

```bash
wget https://www.ipdeny.com/ipblocks/data/countries/cn.zone
curl -LO http://www.ipdeny.com/ipblocks/data/countries/cn.zone

```

## ipset安装

## 创建国内ip网段集合

```bash
pset create china hash:net
```
## ipset导入国内网段

```bash
# 下载并移动
curl -LO http://www.ipdeny.com/ipblocks/data/countries/cn.zone && mv ./cn.zone ~
# 清空
ipset flush china
# 添加
for i in `cat cn.zone` do 
	ipset add cnip $i 
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
