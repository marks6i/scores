docker run \
  -d \
  -t \
  --name scores \
  -p 8080:8080 \
  -e PORT="8080" \
  java/scores

#docker run \
#  --rm \
#  -it \
#  --name scores \
#  -p 8080:8080 \
#  -e PORT="8080" \
#  -e SCORES_INTERACTIVE="1" \
#  java/scores \
#  bash