#!/usr/bin/env bash
curl -SL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" --output terraform.zip
unzip "terraform.zip"
sudo mv terraform /usr/local/bin
terraform --version
rm terraform.zip