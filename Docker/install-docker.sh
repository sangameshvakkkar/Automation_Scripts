#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "🔵 Updating existing list of packages..."
sudo apt update

echo "🔵 Installing prerequisite packages..."
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔵 Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "🔵 Setting up the Docker stable repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔵 Updating package index again..."
sudo apt update

echo "🔵 Installing Docker Engine and Docker CLI..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "🔵 Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "🔵 Adding current user ($USER) to the docker group..."
sudo usermod -aG docker $USER

echo "🔵 Refreshing group membership..."
# Only works for non-root users
newgrp docker <<EOF
echo "✅ Docker installation complete! (Group updated)"
docker --version
EOF

echo "🔵 Docker installation complete! (Group updated)"

echo "🔵 Testing Docker installation..."
docker run hello-world
