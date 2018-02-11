# 1. generate jar
FROM gradle:jdk8-alpine AS build-env

COPY --chown=gradle:gradle . /home/gradle/

RUN gradle clean build --stacktrace

# 2. generate docker image
FROM openjdk:8u151-jre-alpine3.7

WORKDIR /demo-api

COPY --from=build-env --chown=root:root /home/gradle/build/libs/demo-api-1.0-RELEASE.jar /demo-api/demo-api.jar

RUN chmod +x /demo-api/demo-api.jar

EXPOSE 8080

CMD ["java", "-jar", "/demo-api/demo-api.jar"]
