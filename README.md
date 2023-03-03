# Lambda Fucntion with API_Gateway with Terraform and Jenkins

## Overview
Project involves creating a serverless architecture using AWS Lambda and API Gateway. Creation a Lambda function to perform some data processing tasks and then connect it to an API Gateway endpoint to make it accessible over the web.S3 bucket to store files.

## Components
 - GitHub repository with project and Dockerfile
 - Jenkins Master Server with ports:8080 and ssh
 - 2 Jenkins agents 

## Agent Installation

Dependencies for agents:java,terraform,awscli
Install java
```bash
  sudo apt update
  sudo apt install default-jre
 ```
 Install aws cli and export AWS credential 
 ```
  sudo apt install awscli
  export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxx
  export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxx
  export AWS_DEFAULT_REGION=us-east-1
```
Install terraform
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
[Install kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html) 

Connect agents to master with ssh or cli


  


## Provisioning
before you need zip file with application in folder and after run this command
  - `terraform init`
  - `terraform apply  -auto-approve`




## Connect Jenkins master with Git project and Run Build

