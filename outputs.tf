# Root Outputs for S3 Upload API

output "api_endpoint" {
  description = "URL of the API Gateway endpoint for file uploads"
  value       = module.api_gateway.api_endpoint
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket storing uploaded files"
  value       = module.s3_bucket.bucket_name
}

output "lambda_function_name" {
  description = "Name of the Lambda function handling uploads"
  value       = module.lambda.function_name
}

output "aws_region" {
  description = "AWS region where resources are deployed"
  value       = var.aws_region
}
