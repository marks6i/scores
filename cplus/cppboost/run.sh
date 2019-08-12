#docker run \
#  -d \
#  -t \
#  --name cppboost \
#  -p 8080:8080 \
#  -e PORT="8080" \
#  cplus/boost

docker run \
  --rm \
  -it \
  --name cppboost \
  -p 8080:8080 \
  -e PORT="8080" \
  cplus/boost \
  bash
