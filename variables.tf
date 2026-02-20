# Root Variables for S3 Upload API

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project, used for resource naming"
  type        = string
  default     = "s3-upload-api"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for PDF storage (must be globally unique)"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "upload-handler"
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "upload-api"
}

variable "api_stage_name" {
  description = "Name of the API Gateway stage"
  type        = string
  default     = "prod"
}

variable "enable_cors" {
  description = "Enable CORS for the API Gateway"
  type        = bool
  default     = true
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 30
}

variable "lambda_memory_size" {
  description = "Lambda function memory in MB"
  type        = number
  default     = 256
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
