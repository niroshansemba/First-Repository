FROM openjdk:17-alpine

WORKDIR /app

COPY sample.java ./

RUN javac sample.java

CMD ["java", "Sample"]
