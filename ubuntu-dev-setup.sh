#!/bin/bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install git -y

# start jetbrains toolbox
sudo apt install libfuse2
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz
sudo tar -xvzf jetbrains-toolbox-2.3.0.30876.tar.gz -C /opt
sudo /opt/jetbrains-toolbox-2.3.0.30876/jetbrains-toolbox
sudo rm -frd jetbrains-toolbox-2.3.0.30876.tar.gz
# end jetbrains toolbox

sudo snap install code --classic
sudo snap install pycharm-community --classic
sudo snap install postman -y


echo "---------------------------------------"
echo "Start Docker installation"
echo "---------------------------------------"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "---------------------------------------"
echo "Docker Installed"
echo "---------------------------------------"


