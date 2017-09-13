FROM anapsix/alpine-java:8

ENV YOUTRACK_URL=http://download.jetbrains.com/charisma \
    YOUTRACK_VERSION=2017.3 \
    YOUTRACK_BUILD=36019 \
    YOUTRACK_LOCALE=en_us \
    SERVICE_VERSION=0.1.0 \

LABEL Name=docker-youtrack-base \
      Version=${SERVICE_VERSION} \
      Youtrack_version=${YOUTRACK_VERSION}.${YOUTRACK_BUILD} \
      Maintainer=Stanislav

RUN apk add --update openssl && \
    apk add --update build-base && \
    apk add --no-cache supervisor && \
    rm -rf /var/cache && \
    mkdir -p /opt/yt /opt/yt/database /opt/yt/backup /opt/yt/logs  && \
    echo Download from ${YOUTRACK_URL}/youtrack-${YOUTRACK_VERSION}.${YOUTRACK_BUILD}.jar && \
    wget ${YOUTRACK_URL}/youtrack-${YOUTRACK_VERSION}.${YOUTRACK_BUILD}.jar -O /opt/yt/youtrack.jar

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
         -jar /opt/yt/youtrack.jar 8080