# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:fanfan064050' | chpasswd

# 暴露 22 端口
EXPOSE 22
EXPOSE 9080
EXPOSE 80


# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
