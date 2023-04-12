# AWS S3 Bucket Creation Handler

This is a Lambda function that triggers when an S3 bucket object is created and performs a specific action.

## Installation

Create role and add policies
```bash
aws iam create-role --role-name on-bucket-create-lambda-role --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{"Effect": "Allow","Principal": {"Service": "lambda.amazonaws.com"},"Action": "sts:AssumeRole"}]}'
lambda_role_arn= # PUT ROLE ARN HERE
aws iam create-policy --policy-name on-bucket-create-lambda-policy --policy-document \
'{"Version": "2012-10-17","Statement": [{"Sid": "S3CreateBucketPolicy","Effect": "Allow","Action": "lambda:InvokeFunction","Resource": "'$lambda_role_arn'","Condition": {"ArnLike": {"AWS:SourceArn": "arn:aws:s3:::*"},"StringEquals": {"aws:sourceEvent": "s3:CreateBucket"}}}]}'
aws iam attach-role-policy --role-name on-bucket-create-lambda-role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
```

Create the Lambda function
```bash
zip function.zip main.py
aws lambda create-function --function-name s3-on-bucket-create \
--zip-file fileb://function.zip --handler main.lambda_handler --runtime python3.9 \
--role $lambda_role_arn
```

Subscribe to the event
```bash
aws events put-rule --name s3-on-bucket-create-rule --event-pattern '{"source": ["aws.s3"], "detail": {"eventSource": ["s3.amazonaws.com"], "eventName": ["CreateBucket"]}}'
rule_arn= #PUT RULE ARN HERE
aws lambda add-permission --function-name s3-on-bucket-create --statement-id s3-on-bucket-create-permission --action 'lambda:InvokeFunction' --principal events.amazonaws.com --source-arn $rule_arn
aws events put-targets --rule s3-on-bucket-create-rule --targets '{"Id" : "1", "Arn": "'$lambda_role_arn'"}'
```
