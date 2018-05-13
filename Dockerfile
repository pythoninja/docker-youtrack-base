FROM anapsix/alpine-java:8

ARG YOUTRACK_URL=https://download.jetbrains.com/charisma
ARG YOUTRACK_VERSION=2018.1
ARG YOUTRACK_BUILD=41561
ARG YOUTRACK_LOCALE=en_us

LABEL name=docker-youtrack-base \
      youtrack-version=${YOUTRACK_VERSION}.${YOUTRACK_BUILD} \
      maintainer=Stanislav

RUN addgroup -S docker && \
    adduser -S -h /opt/yt -u 1000 -g docker docker && \
    apk add --no-cache --update openssl && \
    rm -rf /var/cache && \
    mkdir -p /opt/yt /opt/yt/database /opt/yt/backup /opt/yt/logs  && \
    echo Download url ${YOUTRACK_URL}/youtrack-${YOUTRACK_VERSION}.${YOUTRACK_BUILD}.jar && \
    wget ${YOUTRACK_URL}/youtrack-${YOUTRACK_VERSION}.${YOUTRACK_BUILD}.jar -O /opt/yt/youtrack.jar && \
    chown -R docker:docker /opt/yt
    
USER docker

EXPOSE 8080

VOLUME ["/opt/yt/logs", "/opt/yt/backup", "/opt/yt/data"]

CMD java -Xmx1g -XX:MaxMetaspaceSize=250M \
         -Djava.awt.headless=true \
         -Djetbrains.youtrack.disableBrowser=true \
         -Djetbrains.youtrack.disableCheckForUpdate=true \
         -Duser.home=/opt/yt \
         -Ddatabase.location=/opt/yt/database \
         -Ddatabase.backup.location=/opt/yt/backup \
         -Djetbrains.youtrack.logDir=/opt/yt/logs \
         -Djetbrains.youtrack.locale=${YOUTRACK_LOCALE} \
         -Djava.security.egd=/dev/zrandom \
         -jar /opt/yt/youtrack.jar 8080
