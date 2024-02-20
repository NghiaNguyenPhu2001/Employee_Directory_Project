FROM maven:3.8.6-openjdk-8-slim AS build
COPY . .
RUN mvn clean package com.Employee_Directory_Project

FROM openjdk:8u131-jdk-slim
COPY --from=build /target/Employee_Directory_Project-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]