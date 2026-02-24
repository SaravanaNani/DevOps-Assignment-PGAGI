#!/bin/bash
exec > /var/log/startup-script.log 2>&1
set -xe

apt-get update -y
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

# Wait for Docker daemon
until docker info >/dev/null 2>&1; do
  sleep 3
done

docker pull saravana2002/pgagi-backend:latest

docker run -d -p 8000:8000 saravana2002/pgagi-backend:latest

