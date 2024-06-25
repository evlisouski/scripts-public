#!/bin/bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install git -y
sudo apt install fish

# REGION jetbrains toolbox installation
sudo apt install libfuse2
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz
tar -xvzf jetbrains-toolbox-2.3.0.30876.tar.gz
sudo mv jetbrains-toolbox-2.3.0.30876 /opt/jetbrains-toolbox
## create symbol link (jetbrains-toolbox)
sudo ln -s /opt/jetbrains-toolbox/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
## region create desktop shortcut
DESKTOP_FILE_CONTENT="[Desktop Entry]
Version=1.0
Type=Application
Name=JetBrains Toolbox
Exec=/opt/jetbrains-toolbox/jetbrains-toolbox
Icon=/opt/jetbrains-toolbox/jetbrains-toolbox.png
Comment=JetBrains Toolbox
Categories=Development;
Terminal=false"
DESKTOP_FILE_PATH="/usr/share/applications/jetbrains-toolbox.desktop"
AUTOSTART_DIR="$HOME/.config/autostart"
AUTOSTART_LINK_PATH="$AUTOSTART_DIR/jetbrains-toolbox.desktop"

echo "$DESKTOP_FILE_CONTENT" | sudo tee $DESKTOP_FILE_PATH > /dev/null
sudo chmod 644 $DESKTOP_FILE_PATH
mkdir -p $AUTOSTART_DIR
ln -s $DESKTOP_FILE_PATH $AUTOSTART_LINK_PATH

echo "Desktop entry created at $DESKTOP_FILE_PATH"
echo "Autostart entry created at $AUTOSTART_LINK_PATH"
## endregion create desktop shortcut
# ENDREGION jetbrains toolbox installation

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


