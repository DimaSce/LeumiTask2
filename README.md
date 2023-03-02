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
## Terraform api gateway discriprion
- aws_api_gateway_rest_api: Defines the REST API and gives it a name.
- aws_api_gateway_resource: Defines a resource for the REST API with the path ".
- aws_api_gateway_method: Defines a method for the resource using the HTTP GET method with no authorization.
- aws_api_gateway_integration: Specifies the integration between the API Gateway and the Lambda function, which is invoked using the AWS_PROXY integration type and a URI constructed from the Lambda ARN.
- aws_lambda_permission: Grants permission to the API Gateway to invoke the Lambda function using the ARN of the REST API as the source ARN.
- aws_api_gateway_method_response: Defines the method response for the GET method with a 200 status code.
- aws_api_gateway_integration_response: Defines the integration response for the GET method with a 200 status code.
- aws_api_gateway_deployment: Deploys the API to a stage called "prod".

## Terraform configuration file deploys an AWS Lambda function discription

  - provider: Sets up the AWS provider and specifies the region where the resources will be created.
  - random_pet: Generates a random name to be used for the S3 bucket where the Lambda function's code will be stored.
  - aws_s3_bucket: Creates an S3 bucket to store the Lambda function's code.
  - data "archive_file" : Archives the directory and creates a zip file.
  - aws_s3_object "lambda_hello_world": Uploads the zip file to the S3 bucket.
  - aws_iam_role: Creates an IAM role that the Lambda function can assume.
  - aws_iam_role_policy_attachment: Attaches the AWSLambdaBasicExecutionRole policy to the IAM role, which grants the function basic execution permissions.
  - aws_lambda_function: Creates the Lambda function itself, using the uploaded code from the S3 bucket.
  


## Pipeline stages
- Provision Lambda function and Upload artifact to S3 with Terraform
  - `terraform apply -f lmabda_s3/main.tf -auto-approve`
- Connection API gateway and Lambda with Terraform
  - `terraform apply -f api_gateway/main.tf -auto-approve`  



## Connect Jenkins master with Git project and Run Build

