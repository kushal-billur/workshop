#!/bin/bash

# Navigate to the deployment directory
cd /home/ubuntu

# Pull the latest code
git clone https://github.com/kushal-billur/workshop.git app || (cd app && git pull origin main)

# Build and run the Docker container
cd app
sudo docker build -t my-app .
sudo docker stop devops-site || true
sudo docker rm devops-site || true
sudo docker stop my-app-container || true
sudo docker rm my-app-container || true
sudo docker run -d --name my-app-container -p 80:80 my-app

echo "Deployment completed successfully!"