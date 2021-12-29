##api-gateway

FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install



FROM openjdk:8-jdk-alpine
ENV PORT=8765
ENV DISCOVERY_URL="http://${LOCAL_HOST}:8761"
WORKDIR /app
COPY --from=build /app/target/api-gateway.jar /app
ENTRYPOINT ["java", "-jar", "api-gateway.jar"]
EXPOSE 8765
