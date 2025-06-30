FROM mysql:5.7

# 复制配置文件并设置权限
COPY ./my.cnf /etc/mysql/my.cnf 
# 注意：路径基于Dockerfile所在目录
RUN chmod 644 /etc/mysql/my.cnf