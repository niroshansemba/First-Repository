FROM openjdk:17-alpine

WORKDIR /app

COPY sample.java ./

RUN javac Sample.java

CMD ["java", "Sample"]
