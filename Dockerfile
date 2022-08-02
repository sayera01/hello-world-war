FROM openjdk:11 as 
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN mvn compile
RUN mvn package

FROM tomcat
COPY --from=0  /usr/src/myapp/target/*.war /usr/local/tomcat/webapps/
COPY --from=0  /usr/src/myapp/target/webapps/*.war /usr/local/tomcat/webapps/
