FROM openjdk:20 as build
WORKDIR /app
COPY . ./
RUN microdnf install findutils
RUN ./gradlew build -x test

FROM openjdk:20-jdk-slim
WORKDIR /app
COPY --from=build /app/build/libs/spring-boot-https-0.0.1.jar .
CMD ["java", "-jar", "spring-boot-https-0.0.1.jar"]