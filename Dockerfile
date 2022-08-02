FROM maven:3.6.0-jdk-11-slim 
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM tomcat
COPY --from=0  /home/app/target/*.war /usr/local/tomcat/webapps/
