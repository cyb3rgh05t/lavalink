ARG BASE=azul/zulu-openjdk-alpine:17

FROM ${BASE} as base

LABEL maintainer=cyb3rgh05t
LABEL org.opencontainers.image.source https://github.com/cyb3rgh05t/lavalink

ENV PORT=2333
ENV PASSWORD=youshallnotpass
ENV MEMORY=300M

RUN apk add --no-cache curl bash && \
    mkdir /opt/lavalink && \
    addgroup -g 443 lavalink && \
    adduser -S -h /opt/lavalink -u 443 -G lavalink lavalink

USER lavalink
WORKDIR /opt/lavalink

COPY start.sh /opt/lavalink
COPY application.example.yml /opt/lavalink

ENTRYPOINT [ "bash", "/opt/lavalink/start.sh" ]
