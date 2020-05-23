HOST=$1
PORT=$2
VERSION=$3
REGISTRY_PORT=$4
docker run -d \
-p $PORT:8000 \
--expose=$PORT \
--name="codelab" \
$HOST:$REGISTRY_PORT/codelab:$VERSION