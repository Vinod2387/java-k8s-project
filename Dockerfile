FROM openjdk:17-jdk-slim
COPY target/hello-world.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
