FROM golang:1-alpine as builder

ARG VERSION

RUN apk add --no-cache git build-base bash ca-certificates

RUN git clone --branch "main" --single-branch \
    https://github.com/jessepeterson/kmfddm.git  /go/src/github.com/jessepeterson/kmfddm && \
    cd /go/src/github.com/jessepeterson/kmfddm && \
    git checkout "$VERSION" && \
    make

FROM alpine:3

RUN apk add --no-cache ca-certificates

COPY --from=builder /go/src/github.com/jessepeterson/kmfddm/kmfddm-linux-amd64 /
COPY docker-entrypoint.sh /

CMD ["/docker-entrypoint.sh"]
