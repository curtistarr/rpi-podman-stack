#!/bin/bash

set -e

# Clone the GitHub repo
REPO_URL="https://github.com/curtistarr/rpi-podman-stack.git"
TARGET_DIR="rpi-podman-stack"

echo "[+] Installing dependencies..."
sudo apt update && sudo apt install -y git ansible curl

if [ ! -d "$TARGET_DIR" ]; then
  echo "[+] Cloning repository from $REPO_URL..."
  git clone "$REPO_URL"
else
  echo "[*] Repo already exists locally. Pulling latest changes..."
  cd "$TARGET_DIR"
  git pull
  cd ..
fi

echo "[+] Running Ansible playbook..."
cd "$TARGET_DIR/ansible"
ansible-playbook -i inventory playbook.yml