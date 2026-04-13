#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install prerequisite tools
sudo apt-get install -y gnupg software-properties-common curl unzip

# --- 1. Install AWS CLI v2 ---
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/

# --- 2. Install Terraform ---

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update

sudo apt install terraform

terraform --version

# -------3. Install Docker---------------

curl https://get.docker.com | bash

sudo apt install net-tools -y

# --- Verification ---
echo "------------------------------"
echo "Installation Complete!"
aws --version
terraform -version
