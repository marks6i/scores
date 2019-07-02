docker run \
  -d \
  --volume `pwd`/scores.psgi:/app/scores.psgi \
  --publish 8080:8080 \
  perl/scores

#docker run \
#  --rm \
#  -it \
#  --volume `pwd`/scores.psgi:/app/scores.psgi \
#  --publish 8080:8080 \
#  perl/scores \
#  bash
