  FROM openjdk:11
    COPY target/Java-jenkins-in-docker-1.0-SNAPSHOT Java-jenkins-in-docker.jar
    ENTRYPOINT ["java", "-jar","java-jenkins-docker.jar"]
    EXPOSE 8080