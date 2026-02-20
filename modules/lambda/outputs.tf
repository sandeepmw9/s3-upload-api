# Outputs for Lambda Module

output "function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.upload_handler.arn
}

output "function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.upload_handler.function_name
}

output "function_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  value       = aws_lambda_function.upload_handler.invoke_arn
}
