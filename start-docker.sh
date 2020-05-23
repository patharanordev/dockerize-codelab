SERVICE_PORT=$1
DOCKER_REGISTRY=$2
VERSION=$3
docker run -d \
-p $SERVICE_PORT:8000 \
--expose=$SERVICE_PORT \
--name="codelab" \
$DOCKER_REGISTRY/dockerize-codelab:$VERSION