output "arn" {
  description = "ARN of the API Gateway"
  value       = aws_api_gateway_rest_api.rest_api.arn
}

output "invoke_url" {
  description = "Invoke URL of API Gateway"
  value       = aws_api_gateway_deployment.deployment.invoke_url
}
