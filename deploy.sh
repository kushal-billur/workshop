#!/bin/bash

# Navigate to the deployment directory
cd /home/ubuntu

echo "Starting deployment..."

# Pull the latest code
git clone https://github.com/kushal-billur/workshop.git app || (cd app && git pull origin main)

echo "Code updated. Building container..."

# Build and run the Docker container
cd app
sudo docker build -t my-app .
echo "Container built. Stopping old containers..."
sudo docker stop devops-site || true
sudo docker rm devops-site || true
sudo docker stop my-app-container || true
sudo docker rm my-app-container || true
echo "Starting new container..."
sudo docker run -d --name my-app-container -p 80:80 my-app

echo "Deployment completed successfully!"
echo "Container status:"
sudo docker ps