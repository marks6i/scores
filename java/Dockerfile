# fetch basic image
FROM maven:3-jdk-12 as build

# application  placed into /app
RUN mkdir -p /app
WORKDIR /app

# selectively add the POM file and
# install dependencies
COPY pom.xml .
COPY src ./src

# rest of the project
RUN mvn install -DskipTests

RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM openjdk:12-jdk-oraclelinux7
WORKDIR /app
VOLUME /tmp
ARG TARGET=/app/target/
COPY --from=build ${TARGET}/lib /app/lib
COPY --from=build ${TARGET}/classes .

EXPOSE 8080
ENTRYPOINT ["java","-cp","/app:/app/lib/*","com.energyrox.scores.Main"]
