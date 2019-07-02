docker run \
 -d \
  --name scores \
  -p 8080:8080 \
  -e PORT="8080" \
  python3/scores

#docker run \
#  --rm \
#  -it \
#  --name scores \
#  -p 8080:8080 \
#  -e PORT="8080" \
#  python3/scores \
#  bash