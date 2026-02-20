# Outputs for API Gateway Module

output "api_id" {
  description = "ID of the API Gateway"
  value       = aws_api_gateway_rest_api.upload_api.id
}

output "api_endpoint" {
  description = "Full URL of the API endpoint"
  value       = "${aws_api_gateway_deployment.upload_api.invoke_url}${aws_api_gateway_stage.upload_api.stage_name}/upload"
}

output "api_arn" {
  description = "ARN of the API Gateway"
  value       = aws_api_gateway_rest_api.upload_api.arn
}
