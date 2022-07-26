ARG BASE=fredboat/lavalink:dev
FROM ${BASE} as base

LABEL maintainer=cyb3rgh05t
LABEL org.opencontainers.image.source https://github.com/cyb3rgh05t/lavalink

#ENV PORT=2333
#ENV PASSWORD=youshallnotpass
#ENV MEMORY=300M

WORKDIR /opt/Lavalink

#COPY Lavalink.jar Lavalink.jar
COPY start.sh /opt/Lavalink
COPY application.yml /opt/Lavalink

ENTRYPOINT [ "bash", "/opt/Lavalink/start.sh" ]
#ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-Xmx4G", "-jar", "Lavalink.jar"]

