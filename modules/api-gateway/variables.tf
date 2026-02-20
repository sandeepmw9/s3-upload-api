# Variables for API Gateway Module

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "stage_name" {
  description = "Name of the API Gateway stage"
  type        = string
  default     = "prod"
}

variable "enable_cors" {
  description = "Enable CORS for the API"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to API Gateway"
  type        = map(string)
  default     = {}
}
