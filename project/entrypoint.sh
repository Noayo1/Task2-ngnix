#!/bin/sh
set -e

echo "Waiting for MySQL at ${DB_HOST}:3306..."

while ! nc -z ${DB_HOST} 3306; do
  echo "MySQL not ready yet... retrying in 2 seconds"
  sleep 2
done

echo "MySQL is ready. Starting Lavagna..."

exec java \
  -Xms64m \
  -Xmx128m \
  -Ddatasource.dialect="${DB_DIALECT}" \
  -Ddatasource.url="${DB_URL}" \
  -Ddatasource.username="${DB_USER}" \
  -Ddatasource.password="${DB_PASS}" \
  -Dspring.profiles.active="${SPRING_PROFILE}" \
  -jar /app/target/lavagna-jetty-console.war --headless
