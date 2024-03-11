FROM gcr.io/kaniko-project/executor:latest AS executor
FROM alpine:edge as build

LABEL maintainer="Alexander S. <alexander@sharapov.biz>"

RUN apk add curl
FROM scratch
COPY --from=executor /kaniko /kaniko
COPY --from=build /usr/bin/curl /curl