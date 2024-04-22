FROM openjdk:21-slim
MAINTAINER Robert Andersson

ARG VERSION=14.0.9
ARG URL=https://build.pmease.com/download/187.latest_successful/artifacts/quickbuild-$VERSION.tar.gz
ARG POSTGRES_VERSION=42.7.3

WORKDIR /opt/

RUN apt update && apt install -y procps python3-pip python3-virtualenv && apt clean
ADD $URL .
RUN tar xzvf $(basename $URL) && rm -f $(basename $URL)
RUN mv quickbuild-$VERSION quickbuild
ADD https://jdbc.postgresql.org/download/postgresql-$POSTGRES_VERSION.jar /opt/quickbuild/plugins/com.pmease.quickbuild.libs/

ADD install-tree/ /

EXPOSE 8810
CMD /opt/quickbuild/run.sh console
