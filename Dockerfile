# Use a base image with Java installed
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Download Sparrow wallet jar
ADD https://github.com/sparrowwallet/sparrow/releases/latest/download/Sparrow.jar .

# Expose the port Sparrow uses (default is 5000)
EXPOSE 5000

# Command to run the Sparrow wallet
CMD ["java", "-jar", "Sparrow.jar"]
