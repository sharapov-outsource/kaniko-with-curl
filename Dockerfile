FROM gcr.io/kaniko-project/executor:latest AS executor

FROM alpine:edge as build
RUN apk add --no-cache curl

FROM golang:1.22

LABEL maintainer="Alexander S. <alexander@sharapov.biz>"

COPY --from=executor /kaniko /kaniko
COPY --from=build /usr/bin/curl /curl