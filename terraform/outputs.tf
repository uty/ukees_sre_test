output "lambda_arn" {
  description = "ARN of the created lambda"
  value       = module.lambda.arn
}

output "api_gateway_arn" {
  description = "ARN of the created API Gateway"
  value       = module.api_gateway.arn
}

output "api_gateway_invoke_url" {
  description = "Invoke URL of the created API Gateway"
  value       = module.api_gateway.invoke_url
}
