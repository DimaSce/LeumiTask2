# Input variable definitions

variable "region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-1"
}

variable "account_id" {
  description = "AWS region for all resources."

  type    = string
  default =  "022569946651"
}

variable "lambda_function_name" {
  description = "AWS region for all resources."

  type    = string
  default = "HelloWorld"
}

variable "lambda_arn" {
  description = "AWS region for all resources."

  type    = string
  default = "arn:aws:lambda:us-east-1:022569946651:function:HelloWorld"
}

variable "function_name" {
  description = "AWS region for all resources."

  type    = string
  default = "HelloWorld"
}
