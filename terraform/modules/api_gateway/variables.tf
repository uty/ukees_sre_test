variable "lambda_invoke_arn" {
  description = "Lambda invoke ARN to integrate"
  type        = string
}

variable "name" {
  description = "API gateway name"
  type        = string
}

variable "description" {
  description = "API gateway description"
  type        = string
  default     = "Test API Gateway"
}
