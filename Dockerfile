FROM openjdk:11-jre-slim

WORKDIR /app

COPY ./build/libs/sparrow-*.jar ./sparrow.jar

CMD ["java", "-jar", "sparrow.jar"]
