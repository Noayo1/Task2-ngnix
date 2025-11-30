FROM maven:3.6.3-openjdk-8

WORKDIR /app

COPY pom.xml /app/
COPY src /app/src
COPY LICENSE-GPLv3.txt /app/

RUN mvn clean package -DskipTests

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]