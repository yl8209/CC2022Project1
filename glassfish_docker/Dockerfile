FROM java:8

ENV PATH=$PATH:/tmp/sh

ADD entry.sh /tmp/sh/entry.sh
ADD adf-essentials.zip /tmp/adf-essentials.zip
ADD mysql-connector-java-5.1.47-bin.jar /tmp/mysql-connector-java-5.1.47-bin.jar
ADD archemy-security-1.0-SNAPSHOT-jar-with-dependencies.jar /tmp/archemy-security-1.0-SNAPSHOT-jar-with-dependencies.jar
ADD archemy.ear /tmp/archemy.ear

ADD old_passwordfile.txt /tmp/old_passwordfile.txt
ADD new_passwordfile.txt /tmp/new_passwordfile.txt

ADD grizzly-npn-bootstrap.jar /tmp/grizzly-npn-bootstrap.jar

ADD http://download.oracle.com/glassfish/5.0.1/release/glassfish-5.0.1.zip /tmp/glassfish.zip

RUN unzip /tmp/glassfish.zip && rm /tmp/glassfish.zip

RUN mv /tmp/grizzly-npn-bootstrap.jar /glassfish5/glassfish/modules/endorsed/grizzly-npn-bootstrap.jar 

RUN mv /tmp/mysql-connector-java-5.1.47-bin.jar /glassfish5/glassfish/domains/domain1/lib/mysql-connector-java-5.1.47-bin.jar

RUN mv /tmp/archemy-security-1.0-SNAPSHOT-jar-with-dependencies.jar /glassfish5/glassfish/domains/domain1/lib/archemy-security-1.0-SNAPSHOT-jar-with-dependencies.jar

RUN unzip -j /tmp/adf-essentials.zip -d /glassfish5/glassfish/domains/domain1/lib && rm /tmp/adf-essentials.zip

EXPOSE 4848
EXPOSE 8080

ENTRYPOINT ["entry.sh"]



