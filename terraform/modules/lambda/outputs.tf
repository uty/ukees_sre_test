output "arn" {
  description = "ARN of the lambda"
  value       = aws_lambda_function.lambda.arn
}

output "invoke_arn" {
  description = "Invoke ARN of the lambda"
  value       = aws_lambda_function.lambda.invoke_arn
}
