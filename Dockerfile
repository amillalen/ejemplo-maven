FROM adoptopenjdk/openjdk8:latest AS builder
RUN mkdir /app
COPY . ./app/
WORKDIR ./app
RUN ./mvnw package


FROM adoptopenjdk/openjdk8:latest
WORKDIR /root/
COPY --from=builder /app/build//DevOpsUsach2020-0.0.1.jar ./
CMD ["java", "-jar","DevOpsUsach2020-0.0.1.jar"]

