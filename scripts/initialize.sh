#!/bin/bash

# Setup dependencies
##  Install NodeJS
NODE_MAJOR=20
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install -y nodejs

##  Install packages
npm i --omit dev
npm run build

# Allowing port 443 access
apt-get install -y libcap2-bin
setcap cap_net_bind_service=+ep `readlink -f \`which node\``