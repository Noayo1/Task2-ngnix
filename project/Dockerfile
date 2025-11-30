FROM maven:3.9.4-eclipse-temurin-8

WORKDIR /app

RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY pom.xml /app/
COPY src /app/src
COPY LICENSE-GPLv3.txt /app/

RUN mvn clean package -DskipTests

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
