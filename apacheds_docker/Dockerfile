FROM java:8

ENV ADS_VERSION=2.0.0.AM25

ADD https://archive.apache.org/dist/directory/apacheds/dist/2.0.0.AM25/apacheds-2.0.0.AM25.tar.gz /tmp/apacheds.tgz

RUN tar -C /opt -xf /tmp/apacheds.tgz && rm /tmp/apacheds.tgz

ENV ADS_INSTANCES=/ads \
    ADS_HOME=/opt/apacheds-${ADS_VERSION}

EXPOSE 10389 10636

WORKDIR $ADS_HOME
RUN mkdir $ADS_INSTANCES && cp -r instances/default $ADS_INSTANCES

VOLUME ["/ads"]

ENTRYPOINT ["bin/apacheds.sh","run"]