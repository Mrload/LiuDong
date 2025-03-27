

# 客户端

## nmcli c[onnection]

> NetworkManager's connections
> COMMAND := { show | up | down | add | modify | clone | edit | delete | monitor | reload | load | import | export }

### 配置静态IP
#### 查看现有链接
```bash
nmcli c show 

### 
	NAME                UUID                                  TYPE      DEVICE  
	static              c37ccc1e-7577-4b40-9f8e-a0df55a683e3  ethernet  eth1    
	docker0             a57fd9da-cb15-4694-bd46-70de4c340225  bridge    docker0 
	Wired connection 1  bcaae8c8-2ef5-3fb6-9ed3-b93c0c012a18  ethernet  --      
	Wired connection 2  31d68b3c-841b-3304-829a-904822a1a783  ethernet  --      
	YOMIPAPA_E91F90     53708a7d-25a5-410a-92df-992d5cc2f254  wifi      --      

```

#### 修改或创建一个链接
```bash

# 新建
sudo nmcli con add \  # 新增
	type ethernet \  # 类型
	con-name "my-static-ip" \  # 链接名称
	ifname eth0 \  # 网卡名称
	ipv4.addresses "192.168.1.100/24" \  # ip
	ipv4.gateway "192.168.1.1" \  # 网关
	ipv4.dns "8.8.8.8" \  # dns
	ipv4.method manual  # 网络类型

```

```bash

# 修改
sudo nmcli con mod "my-static-ip" \
	ipv4.dns "114.114.114.114"

```

#### 启用新的链接
```bash
nmcli con up "my-static-ip"
```

> 配置会永久保存至 `/etc/sysconfig/network-scripts/ifcfg-[连接名称]`，可手动编辑或备份