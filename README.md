#  DevOps Case Infra

Bu projede Raspberry Pi Üzerinde Ansible + Kubespray ile Kubernetes Cluster Kurulumu ve iki Raspberry Pi (1 master, 1 worker) kullanarak Ansible ve Kubespray yardımıyla **multi-node Kubernetes cluster** kurulumu yapilacaktir.

## On Gereksinimler

### Donanım
- 2 adet Raspberry Pi
- sabit IP atamasi

### Yazılım
- Raspberry Pi OS kurulu olacak
- SSH ile erişimi aktif
- Python 3 yukelemesini kontrol edin

---

## 2. Ağ Yapilandirmasi

Her Pi’ye sabit IP atayın:

- **Master**: `192.168.1.10`
- **Worker**: `192.168.1.11`

Hostname’leri belirleyin:

```bash
sudo hostnamectl set-hostname master
sudo hostnamectl set-hostname worker

### Ansible Kurulumu

sudo apt update && sudo apt install -y python3-pip git
pip3 install ansible

## Kubespray Kurulumu

git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip3 install -r requirements.txt

## Envanter Olusturulmasi

cp -p inventory/sample inventory/devopscase
nano inventory/devopscase/hosts.yaml

---

### Ansible araciligi ile k8s cluster kurulumu

ansible-playbook -i inventory/devopscase/hosts.yaml cluster.yml -b -v
