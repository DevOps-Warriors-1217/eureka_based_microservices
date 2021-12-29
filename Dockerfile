##author-service

FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install


FROM openjdk:8-jdk-alpine
MAINTAINER Wendell Adriel <wendelladriel.ti@gmail.com>
ENV PORT=8081
ENV DISCOVERY_URL="http://${LOCAL_HOST}:8761"
WORKDIR /app
COPY --from=build /app/target/author-service.jar /app
ENTRYPOINT ["java", "-jar", "author-service.jar"]
EXPOSE 8081
