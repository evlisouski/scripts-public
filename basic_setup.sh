#!/bin/bash
echo "Turn off screensaver"
current=$(gsettings get org.gnome.desktop.session idle-delay | cut -d' ' -f2)
if [ $current -ne 0 ]; then
	gsettings set org.gnome.desktop.session idle-delay 0
	echo "idle-delay set to 0"
else
	echo "idle-delay alredy set to 0"
fi

sudo apt update && sudo apt upgrade -y

#sudo apt install open-vm-tools-desktop -y
sudo apt install -y python3-pip
sudo apt install -y python3-venv

sudo apt install git -y
sudo snap install code --classic
sudo snap install pycharm-community --classic
sudo snap install postman

echo "Docker installation"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world


