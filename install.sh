#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# CHECK IF IT WORKS WITHOUT COMMAND
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sudo apt-update

sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo -y

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update && sudo apt-get install google-cloud-cli 

# For x86_64 (AMD64) run this (run uname -m to make sure which architecture you have):
sudo apt install unzip -y

wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip

unzip terraform_1.7.4_linux_amd64.zip

sudo mv terraform /usr/local/bin

gcloud init

gcloud projects create group-project-3-hera --name="Group Project"  #var

gcloud config set project group-project-3-hera  #var

# gcloud storage buckets create gs://project3-group-hera --location=US #var

# gcloud iam roles create ProjectCreator --project=certain-ellipse-413904 --title=ProjectCreator --permissions=resourcemanager.projects.create
