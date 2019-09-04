# fetch basic image
FROM cplus/boost as build

COPY ./served /usr/src/served
WORKDIR /usr/src/served

RUN mkdir ../served.build \
    && cd ../served.build \
    && cmake ../served \
    && make \
    && cd ../served

COPY ./src /usr/src/scores
WORKDIR /usr/src/scores

#RUN g++ -I/usr/src/served/src -L/usr/src/served/lib -lserved scores.cpp -o scores