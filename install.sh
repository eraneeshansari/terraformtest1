#!/bin/bash
set -euo pipefail

echo "==> Updating package index..."
sudo apt-get update -y

echo "==> Installing prerequisite packages..."
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "==> Creating keyring directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "==> Adding Docker's official GPG key..."
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "==> Setting up Docker's apt repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "==> Updating package index with Docker repo..."
sudo apt-get update -y

echo "==> Installing Docker Engine, CLI, containerd, buildx, and compose plugin..."
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "==> Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "==> Adding current user ($USER) to docker group..."
sudo usermod -aG docker "$USER"

echo "==> Verifying installation..."
sudo docker --version
sudo docker compose version

echo ""
echo "=================================================================="
echo "Docker installed successfully!"
echo "Log out and back in (or run 'newgrp docker') for group changes"
echo "to take effect so you can run docker without sudo."
echo "Test with: docker run hello-world"
echo "=================================================================="

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Run test container
docker run -d --name nginx -p 80:80 nginx


