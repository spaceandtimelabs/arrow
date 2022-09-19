FROM dcm4che/sqlline

COPY target/flight-sql-jdbc-driver-10.0.0-SNAPSHOT.jar /usr/share/java

ENV JAVA_CLASSPATH=/usr/share/java/flight-sql-jdbc-driver-10.0.0-SNAPSHOT.jar

RUN echo 'sqlline -d org.apache.arrow.driver.jdbc.ArrowFlightJdbcDriver --verbose=true -n admin -p password -u jdbc:arrow-flight://$1:50050?useEncryption=false' > main.sh

ENTRYPOINT ["/bin/bash", "main.sh"]
