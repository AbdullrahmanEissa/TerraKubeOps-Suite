# TerraKubeOps-Suite
🌐 Fully Automated Kubernetes (k3s) Nginx Deployment with Ansible

![Ansible](https://img.shields.io/badge/Ansible-Automation-blue?style=for-the-badge\&logo=ansible)
![Docker](https://img.shields.io/badge/Docker-Container-blue?style=for-the-badge\&logo=docker)
![k3s](https://img.shields.io/badge/k3s-Kubernetes-lightgrey?style=for-the-badge)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?style=for-the-badge\&logo=ubuntu)
![Nginx](https://img.shields.io/badge/Nginx-WebServer-green?style=for-the-badge\&logo=nginx)

---

## 🚀 Overview

This project automates the deployment of an **Nginx web server on k3s** Kubernetes cluster using **Ansible**, fully automated:

* Installs k3s on multiple Ubuntu nodes
* Configures Docker and required dependencies
* Deploys an Nginx application using `kubectl` through Ansible
* Automatically exposes the Nginx service as a NodePort
* Handles updates and redeployments with zero manual work
* Fully automated playbook with reusable inventory

---

## 🧠 Architecture Flow

```
┌───────────────┐
│ Ansible Playbook │ → Installs Docker, k3s, deploys Nginx
└───────┬───────┘
        │
        ▼
┌───────────────┐
│  Ubuntu Nodes │ → k3s cluster nodes, multiple instances
└───────┬───────┘
        │
        ▼
┌───────────────┐
│ Nginx Service │ → NodePort exposed, accessible externally
└───────────────┘
```

---

## ⚙️ Files

| File            | Purpose                                                             |
| --------------- | ------------------------------------------------------------------- |
| `inventory`     | List of cluster nodes with SSH keys and user configuration          |
| `ansible.cfg`   | Configures Ansible to use inventory and private key                 |
| `k3s-nginx.yml` | Main playbook: installs Docker, k3s, deploys Nginx, exposes service |
| `roles/`        | Optional: split tasks (Docker, k3s, Nginx) for modularity           |

---

## 🏗️ Deployment Steps

### 🎯 STEP 1 — Configure Inventory

Add your node IPs and SSH key:

```ini
[k3snodes]
192.168.1.13
192.168.1.14

[k3snodes:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/home/user/.ssh/id_rsa
```

### 🎯 STEP 2 — Run the Playbook

```bash
ansible-playbook -i inventory k3s-nginx.yml
```

* Installs Docker & k3s
* Creates Kubernetes cluster
* Deploys Nginx
* Exposes NodePort for external access

### 🎯 STEP 3 — Access Nginx

After playbook finishes:

```bash
kubectl get svc nginx -o wide
```

* Access Nginx at: `http://<node_ip>:<nodePort>`

---

## 🌐 Features

| Feature                       | Status |
| ----------------------------- | ------ |
| Multi-node k3s cluster        | ✔      |
| Docker installed & configured | ✔      |
| Nginx Deployment              | ✔      |
| NodePort service exposed      | ✔      |
| Fully automated via Ansible   | ✔      |
| Modular roles support         | ✔      |
| Production-ready structure    | ✔      |

---

## 🛠️ Technologies

| Layer         | Tools                        |
| ------------- | ---------------------------- |
| Automation    | Ansible                      |
| Container     | Docker                       |
| Orchestration | k3s (lightweight Kubernetes) |
| Web Server    | Nginx                        |
| OS            | Ubuntu 22.04 LTS             |
| Access        | SSH / Ansible Key            |

---

## 📈 Future Roadmap

* Add Helm chart support for deploying apps
* Auto SSL with cert-manager
* Continuous deployment pipeline with GitHub Actions
* Add monitoring with Netdata / Prometheus
* Auto-scaling nodes for cluster

---

## 👤 Author

**Abdullrahman Eissa** – Linux System Administrator | DevOps Enthusiast
[GitHub](https://github.com/AbdullrahmanEissa) | [LinkedIn](https://www.linkedin.com/in/abdullrahman-eissa/)

Do you want me to do that next?
