
# 启动

```bash
mkdir gitlab gitlab/etc gitlab/log gitlab/opt  

docker run \
-id \
-p 3000:80 \
-p 3022:22 \
-v /data/users/yuncoder03/gitlab/etc:/etc/gitlab  \
-v /data/users/yuncoder03/gitlab/log:/var/log/gitlab \
-v /data/users/yuncoder03/gitlab/opt:/var/opt/gitlab \
--log-opt max-size=100m \
--log-opt max-file=3 \
--restart always \
--privileged=true \
--name gitlab \
gitlab/gitlab-ce

'''
命令解释：
-i  以交互模式运行容器，通常与 -t 同时使用命令解释：

-d  后台运行容器，并返回容器ID

-p 3000:80  将容器内80端口映射至宿主机3000端口，这是访问gitlab的端口

-p 3022:22  将容器内22端口映射至宿主机3022端口，这是访问ssh的端口

-v ./gitlab/etc:/etc/gitlab  将容器/etc/gitlab目录挂载到宿主机./gitlab/etc目录下，
	若宿主机内此目录不存在将会自动创建，其他两个挂载同这个一样

--restart always  容器自启动

--privileged=true  让容器获取宿主机root权限

--name gitlab-test  设置容器名称为gitlab

--log-opt max-size=2G  限制日志文件大小 /var/lib/docker/containers/xxx/xxx-json.log

--log-opt max-file=3  限制日志文件的数量为 3 个

gitlab/gitlab-ce  镜像的名称，这里也可以写镜像ID
'''

```

# 初始密码

`docker exec -it d5d247ee3192 grep "Password:" /etc/gitlab/initial_root_password`

# 配置

## 登录

	账户：root
	密码：初始密码

## 语言

	头像->settings->Preferences->language

## 修改密码

	账户->密码


## clone地址

```bash
docker exec -it xxx bash

vi /etc/gitlab/gitlab.rb

# http 地址 不需port
external_url 'http://xxx.xxx.xxx.xxx'

# ssh
gitlab_rails['gitlab_ssh_host'] = 'xxx.xxx.xxx.xxx'
gitlab_rails['gitlab_shell_ssh_port'] = 3022

gitlab-ctl reconfigure
```