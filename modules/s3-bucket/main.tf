# S3 Bucket Module
# This module creates an S3 bucket for PDF storage with security configurations

resource "aws_s3_bucket" "pdf_storage" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "pdf_storage" {
  bucket = aws_s3_bucket.pdf_storage.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pdf_storage" {
  count  = var.enable_encryption ? 1 : 0
  bucket = aws_s3_bucket.pdf_storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pdf_storage" {
  bucket = aws_s3_bucket.pdf_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
