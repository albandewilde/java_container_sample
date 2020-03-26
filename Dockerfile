FROM openjdk:11-jdk as builder

WORKDIR /usr/src/hw

COPY HelloWorld.java .

RUN javac HelloWorld.java


FROM alpine

WORKDIR /usr/src/hw

RUN apk add openjdk11

COPY --from=builder /usr/src/hw/HelloWorld.class .

CMD ["java", "HelloWorld"]
