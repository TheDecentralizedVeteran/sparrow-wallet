FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file (adjust the source as needed)
COPY target/sparrow-wallet.jar sparrow-wallet.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "sparrow-wallet.jar"]
