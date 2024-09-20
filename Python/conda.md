
# Installnation

> 自动安装【Dockerfile常用】

```Dockerfile
...
SHELL ["/bin/bash", "-c"]
RUN bash ./conda_xxx_install.sh -b -p /usr/local/conda
RUN /usr/local/conda/bin/conda init bash
COPY .condarc ~/
RUN conda clean -iy
RUN conda install -y pytorch torchvision torchaudio cpuonly -c pytorch
...

```

# clean

> 换源后，执行一下`docker clean -i`。

# install

- `- y` ：yes
- `-c` : 选择Channel
- 