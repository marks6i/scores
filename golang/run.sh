#docker run \
#  -d \
#  --name scores \
#  -p 8080:8080 \
#  golang/scores

docker run \
  --rm \
  -it \
  --name scores \
  -p 8080:8080 \
  golang/scores \
  bash