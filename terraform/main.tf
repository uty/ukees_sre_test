terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    archive = {
      source = "hashicorp/archive"
      version = "2.3.0"
    }
  }

  required_version = ">= 1.4.4"
}

provider "aws" {
  region  = var.aws_region
}

provider "archive" {}

module "lambda" {
  source = "./modules/lambda"

  name             = var.lambda_name
  source_code_file = var.lambda_source_file
  handler          = var.lambda_handler_function
}

module "api_gateway" {
  source = "./modules/api_gateway"

  name              = var.api_gateway_name
  lambda_name       = var.lambda_name
  lambda_invoke_arn = module.lambda.invoke_arn
}
