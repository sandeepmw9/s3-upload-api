# S3 Upload API - Terraform Infrastructure

This Terraform configuration creates a serverless PDF file upload system using AWS services.

## Architecture

- **API Gateway**: REST API endpoint for file uploads
- **Lambda**: Python function to validate and process uploads
- **S3**: Secure bucket for PDF storage
- **IAM**: Roles and policies for Lambda execution

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with credentials
- AWS account with permissions to create resources

## Quick Start

1. Copy the example variables file:
```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Edit `terraform.tfvars` with your values (especially `bucket_name` - must be globally unique)

3. Initialize Terraform:
```bash
terraform init
```

4. Review the plan:
```bash
terraform plan
```

5. Deploy:
```bash
terraform apply
```

## Usage

After deployment, use the API endpoint from outputs to upload PDFs:

```bash
# Get the API endpoint
terraform output api_endpoint

# Upload a PDF file
curl -X POST \
  -H "Content-Type: application/pdf" \
  --data-binary @file.pdf \
  https://YOUR_API_ENDPOINT/prod/upload
```

## Outputs

- `api_endpoint`: URL for file uploads
- `s3_bucket_name`: Name of the storage bucket
- `lambda_function_name`: Name of the Lambda function

## Clean Up

```bash
terraform destroy
```
