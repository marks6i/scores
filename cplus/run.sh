#docker run \
#  -d \
#  -t \
#  --name scores \
#  -p 8080:8080 \
#  -e PORT="8080" \
#  cplus/scores

docker run \
  --rm \
  -it \
  --name scores \
  -p 8080:8080 \
  -e PORT="8080" \
  cplus/scores \
  bash
