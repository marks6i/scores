# fetch basic image
FROM cplus/boost as build

COPY ./served /usr/src/served
WORKDIR /usr/src/served

RUN mkdir ../served.build \
    && cd ../served.build \
    && cmake ../served \
    && make \
    && cd ../served \
    && cp lib/libserved.so /usr/local/lib/