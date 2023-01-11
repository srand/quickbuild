FROM openjdk:11
MAINTAINER Robert Andersson

ARG VERSION=12.0.27
ARG URL=https://build.pmease.com/download/174.latest_successful/artifacts/quickbuild-$VERSION.tar.gz
ARG POSTGRES_VERSION=42.2.27

WORKDIR /opt/

RUN apt update && apt install -y python3-pip && apt clean
RUN wget $URL
RUN tar xzvf $(basename $URL) && rm -f $(basename $URL)
RUN mv quickbuild-$VERSION quickbuild
RUN cd /opt/quickbuild/plugins/com.pmease.quickbuild.libs && wget https://jdbc.postgresql.org/download/postgresql-$POSTGRES_VERSION.jar
RUN python3 -m pip install virtualenv

ADD install-tree/ /

EXPOSE 8810
CMD /opt/quickbuild/run.sh console
