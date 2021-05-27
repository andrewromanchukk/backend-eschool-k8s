FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
ARG DB_HOST
ARG DB_USER
ARG DB_PASSWORD

ENV DATASOURCE_URL=$DB_HOST
ENV DATASOURCE_USERNAME=$DB_USER
ENV DATASOURCE_PASSWORD=$DB_PASSWORD
RUN mvn package -DskipTests

FROM openjdk:8-jdk-alpine
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/eschool.jar eschool.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "eschool.jar"]

