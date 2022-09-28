  FROM openjdk:11
    ADD target/untitled.jar untitled.jar
    ENTRYPOINT ["java", "-jar","untitled.jar"]
    EXPOSE 8080