FROM bitnami/git as clone
WORKDIR /app
RUN git clone https://github.com/iamviswajith/spring-petclinic.git

FROM openjdk:11 as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app
RUN ./mvnw package -Dcheckstyle.skip
EXPOSE 9999
ARG JAR=spring-petclinic-2.5.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/app/target/spring-petclinic-2.5.0-SNAPSHOT.jar","--server.port=9999"]
