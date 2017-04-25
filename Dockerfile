FROM frolvlad/alpine-oraclejdk8

ENV SBT_VERSION 1.0.0-M5
ENV SCALA_VERSION 2.12.2

RUN \
  apk add --no-cache --virtual=build-deps curl && \
  apk add --no-cache bash && \
  curl -q -o- -L https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz \
    | tar xzf - -C /usr/local/lib && \
  rm /usr/local/lib/sbt/bin/sbt.bat && \
  apk del build-deps && \
  /usr/local/lib/sbt/bin/sbt update

ENV PATH $PATH:/usr/local/lib/sbt/bin

ENTRYPOINT ["sbt"]
