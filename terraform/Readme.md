
# Lambda + API Gateway

A Terraform configuration that provisions an AWS Lambda function and an API Gateway endpoint that triggers the Lambda function

## Usage

```shell
terraform init
terraform plan -var lambda_source_file="<path>" -var lambda_handler_function="<handler_function_name>" -var lambda_name="<lambda_name>" -var api_gateway_name="<api_gateway_name>"
terraform apply -var lambda_source_file="<path>" -var lambda_handler_function="<handler_function_name>" -var lambda_name="<lambda_name>" -var api_gateway_name="<api_gateway_name>"
```
