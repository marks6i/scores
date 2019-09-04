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

ENV LD_LIBRARY_PATH=/usr/src/served/lib
RUN g++ -I/usr/local/src/boost_1_71_0 \
        -I/usr/src/served/src \
        scores.cpp \
        -o scores \
        -L/usr/local/lib -lboost_system \
        -L/usr/src/served/lib -lserved \
        -lpthread