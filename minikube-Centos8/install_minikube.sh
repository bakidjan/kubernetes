sudo yum update -y
sudo apt install -y dnf
sudo dnf update -y
sudo setenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce --nobest -y
sudo systemctl start docker
sudo systemctl enable docker
usermod -aG sudo $USER
sudo usermod -aG docker $USER && newgrp docker
sudo firewall-cmd --zone=public --add-masquerade --permanent
sudo firewall-cmd --reload
sudo dnf install conntrack -y
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo kubectl version --client
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
#minikube start --driver=none
#minikube status
#kubectl cluster-info
#apres installation, restart le centos et lancer "minikube start --driver=none" en mode sudo






