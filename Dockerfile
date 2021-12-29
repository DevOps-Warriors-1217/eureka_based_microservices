FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install


FROM openjdk:8-jdk-alpine
ENV PORT=8080
ENV DISCOVERY_URL="http://${LOCAL_HOST}:8761"
WORKDIR /app
COPY --from=build /app/target/article-service.jar /app
ENTRYPOINT ["java", "-jar", "article-service.jar"]
EXPOSE 8080
