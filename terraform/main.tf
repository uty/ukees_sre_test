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

  name             = "test_lambda"
  source_code_file = "../python/on_bucket_create/main.py"
  handler          = "handler"
}

module "api_gateway" {
  source = "./modules/api_gateway"

  lambda_invoke_arn = module.lambda.invoke_arn
}
