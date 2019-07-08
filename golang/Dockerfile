FROM golang:1.12-alpine

RUN mkdir /app
WORKDIR /app

COPY scores.go .
COPY src ./src
RUN GOPATH=/app CGO_ENABLED=0 go build -o scores .
EXPOSE 8080
ENTRYPOINT ["/app/scores"]