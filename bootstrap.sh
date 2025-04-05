#!/bin/bash

set -e

REPO_URL="https://github.com/curtistarr/rpi-podman-stack.git"
TARGET_DIR="rpi-podman-stack"

echo "[+] Installing system dependencies..."
sudo apt update && sudo apt install -y git ansible curl

# Clone the repo
if [ ! -d "$TARGET_DIR" ]; then
  echo "[+] Cloning repository from $REPO_URL..."
  git clone "$REPO_URL"
else
  echo "[*] Repo already exists locally. Pulling latest changes..."
  cd "$TARGET_DIR"
  git pull
  cd ..
fi

cd "$TARGET_DIR/ansible"

echo "[+] Installing Ansible Galaxy roles..."
ansible-galaxy install -r requirements.yml

echo "[+] Running Ansible playbook..."
ansible-playbook -i inventory playbook.yml