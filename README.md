# Raspberry Pi Podman Stack

An Ansible-powered container stack for Raspberry Pi using Podman and Podman Compose. Deploys AdGuard Home, Unbound, and Scrypted with persistent config, DNS filtering, and a web UI

## 🚀 Quick Start (One-liner Install)

Run this on your Raspberry Pi:

```bash
curl -sSL https://raw.githubusercontent.com/curtistarr/rpi-podman-stack/main/bootstrap.sh | bash
```

This will:
- Install Git + Ansible
- Clone your repo from GitHub
- Run the playbook interactively (prompting for AdGuard config)