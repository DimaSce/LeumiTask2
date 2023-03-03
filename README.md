# Lambda Fucntion with API_Gateway with Terraform and Jenkins

## Overview
Project involves creating a serverless architecture using AWS Lambda and API Gateway. Creation a Lambda function to perform some data processing tasks and then connect it to an API Gateway endpoint to make it accessible over the web.S3 bucket to store files.

## Components
 - GitHub repository with project and Dockerfile
 - Jenkins Master Server with ports:8080 and ssh
 - 2 Jenkins agents with ports:50000 and ssh

## Agent Installation

Dependencies for agents:java,terraform,awscli

```bash
  sudo apt update
  sudo apt install default-jre
  sudo apt install awscli
```
```
  sudo apt install  software-properties-common gnupg2 curl
  curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
  sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
  sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  ```
  ```
  sudo apt install terraform
  terraform --version
```
Install kubectl 

Connect agents to master with ssh or cli

  


## Pipeline stages
- Provision Lambda function and Upload artifact to S3 with Terraform
  - `terraform apply -f lmabda_s3/main.tf -auto-approve`
- Connection API gateway and Lambda with Terraform
  - `terraform apply -f api_gateway/main.tf -auto-approve`  



## Connect Jenkins master with Git project and Run Build

