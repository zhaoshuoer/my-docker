#定义容器名称名称
DOCKER_NAME=nginx
#定义镜像名称
DOCKER_IMAGES_NAME=registry.cn-hangzhou.aliyuncs.com/shuoer/${DOCKER_NAME}
#如果当前容器正在运行，干掉
if [ $(docker ps -a | grep -c $DOCKER_NAME) -ge 1 ]; then
    docker rm -f ${DOCKER_NAME};
fi
#如果当前本地镜像列表中有，删掉
if [ $(docker images | grep -c ${DOCKER_IMAGES_NAME}) -ge 1 ]; then
    docker rmi -f ${DOCKER_IMAGES_NAME};
fi
#运行
docker run \
    -d \
    --rm \
    -p 80:80 \
    -p 443:443 \
    --link jenkins:jenkins.zscode.com \
    --link node:node.zscode.com \
    --name ${DOCKER_NAME} \
    ${DOCKER_IMAGES_NAME}:latest