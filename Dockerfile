FROM azul/zulu-openjdk:13

LABEL maintainer=cyb3rgh05t
LABEL org.opencontainers.image.source https://github.com/cyb3rgh05t/lavalink

ENV PORT=2333
ENV PASSWORD=youshallnotpass
ENV MEMORY=300M

RUN apk add --no-cache curl bash && \
    mkdir /opt/Lavalink && \
    addgroup -g 443 lavalink && \
    adduser -S -h /opt/Lavalink -u 443 -G lavalink lavalink

USER lavalink
WORKDIR /opt/Lavalink

#COPY Lavalink.jar Lavalink.jar
COPY start.sh /opt/Lavalink
COPY application.example.yml /opt/Lavalink

ENTRYPOINT [ "bash", "/opt/Lavalink/start.sh" ]
#ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-Xmx4G", "-jar", "Lavalink.jar"]

