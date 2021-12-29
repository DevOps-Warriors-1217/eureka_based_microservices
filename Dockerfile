##discovery-service

FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:8-jdk-alpine
ENV PORT=8761
WORKDIR /app
COPY --from=build /app/target/discovery-service.jar /app
ENTRYPOINT ["java", "-jar", "discovery-service.jar"]
EXPOSE 8761
