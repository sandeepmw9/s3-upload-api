# Variables for Lambda Module

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to upload files to"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda execution"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.11"
}

variable "timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 30
}

variable "memory_size" {
  description = "Lambda function memory in MB"
  type        = number
  default     = 256
}

variable "tags" {
  description = "Tags to apply to Lambda function"
  type        = map(string)
  default     = {}
}
