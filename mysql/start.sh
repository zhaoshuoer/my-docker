#mysql环境变量的说明
#MYSQL_ROOT_PASSWORD：必填项，设置root用户的密码
#MYSQL_DATABASE ：启动时创建的数据库名称
#MYSQL_USER, MYSQL_PASSWORD 启动时创建数据的用户和密码
#MYSQL_ALLOW_EMPTY_PASSWORD ：允许数据库密码为空启动（root）[yes/no]
#MYSQL_ONETIME_PASSWORD : 强制用户首次登录修改密码[yes/no]
#MYSQL_ROOT_PASSWORD_FILE : 作为环境变量传递敏感信息的替代方案/run/secrets/mysql-root（目前，这仅支持MYSQL_ROOT_PASSWORD，MYSQL_ROOT_HOST，MYSQL_DATABASE，MYSQL_USER，和MYSQL_PASSWORD）
#数据库默认存储在/var/lib/mysql下，-v "$PWD/mysql":/var/lib/mysql \
#定义容器名称名称
DOCKER_NAME=mysql
#定义镜像名称
DOCKER_IMAGES_NAME=registry.cn-hangzhou.aliyuncs.com/shuoer/${DOCKER_NAME}
#定义容器的端口号
DOCKER_PORT=3306
#如果当前容器正在运行，干掉
if [ $(docker ps -a | grep -c $DOCKER_NAME) -ge 1 ]; then
    docker rm -f ${DOCKER_NAME};
fi
#如果当前本地镜像列表中有，删掉
if [ $(docker images | grep -c ${DOCKER_IMAGES_NAME}) -ge 1 ]; then
    docker rmi -f ${DOCKER_IMAGES_NAME};
fi

docker run \
  -d \
  --rm \
  -p ${DOCKER_PORT}:3306 \
  --name ${DOCKER_NAME} \
  -v "$PWD/mysql_datadir":/var/lib/mysql \
  ${DOCKER_IMAGES_NAME}:latest