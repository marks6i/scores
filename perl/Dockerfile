FROM perl:5.30

RUN    cpanm Carton \
    && mkdir -p /app/

WORKDIR /app/

COPY cpanfile /app

RUN carton install

COPY cmd.sh /app
COPY  scores.psgi /app

ENTRYPOINT ["bash", "/app/cmd.sh"]
