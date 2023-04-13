variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "lambda_name" {
  description = "Lambda name"
  type        = string
}

variable "lambda_source_file" {
  description = "Lambda source code file path"
  type        = string
}

variable "lambda_handler_function" {
  description = "Lambda handler function name"
  type        = string
  default     = "handler"
}

variable "api_gateway_name" {
  description = "API gateway name"
  type        = string
}
