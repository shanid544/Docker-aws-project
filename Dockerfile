FROM maven as build
RUN mkdir -p /app
WORKDIR /app
ADD . /app
RUN mvn clean install
FROM openjdk:8
COPY --from=build /app/target/SpringBootRestWithH2.jar /app/target/SpringBootRestWithH2.jar
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "/app/target/SpringBootRestWithH2.jar"]