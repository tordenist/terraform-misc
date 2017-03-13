#!/usr/bin/env bash

terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')

# Create a move into directory.
cd
mkdir terraform && cd $_

# Download Terraform. URI: https://www.terraform.io/downloads.html
curl -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip

echo '
# Terraform Path.
export PATH=~/terraform/:$PATH
' >>~/.bash_profile

source ~/.bash_profile
