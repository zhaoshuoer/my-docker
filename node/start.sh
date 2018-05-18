#定义容器名称名称
DOCKER_NAME=node
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
    -v "$PWD/app":/app \
    --name ${DOCKER_NAME} \
    -p 8085:8085 \
    ${DOCKER_IMAGES_NAME}:latest