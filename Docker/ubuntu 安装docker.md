
```bash
# 源信息更新
sudo apt update

# 依赖
sudo apt install ca-certificates curl gnupg lsb-release

# GPGKey
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

# 添加Docker的软件源
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

# 安装
sudo apt install docker-ce docker-ce-cli containerd.io

```
