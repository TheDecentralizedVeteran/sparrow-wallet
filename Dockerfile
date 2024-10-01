# Step 1: Build Stage
# Use a Maven image to build the application
FROM maven:3.8.5-openjdk-11 AS builder

# Set the working directory in the builder
WORKDIR /app

# Copy only the necessary files (you may want to refine this further)
COPY pom.xml .
COPY src ./src

# Download dependencies (this will cache them if pom.xml doesn't change)
RUN mvn dependency:go-offline

# Build the application
RUN mvn clean package -DskipTests

# Step 2: Production Stage
# Use a lightweight OpenJDK image for the production
FROM adoptopenjdk:11.0.12-jre-hotspot-alpine

# Set the working directory in the production container
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/sparrow-wallet.jar sparrow-wallet.jar

# Create a non-root user to run the application
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Change to the non-root user
USER appuser

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "sparrow-wallet.jar"]
