import json
import boto3
import base64
import uuid
import os
from datetime import datetime

s3_client = boto3.client('s3')


def lambda_handler(event, context):
    """
    Handle PDF file upload requests from API Gateway.
    
    Args:
        event: API Gateway event containing file data
        context: Lambda context object
        
    Returns:
        dict: Response with status code and body
    """
    try:
        # Extract bucket name from environment
        bucket_name = os.environ.get('S3_BUCKET_NAME')
        if not bucket_name:
            print("ERROR: S3_BUCKET_NAME environment variable not set")
            return {
                'statusCode': 500,
                'headers': {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*'
                },
                'body': json.dumps({'error': 'Internal server error'})
            }
        
        # Get file content from request body
        if event.get('isBase64Encoded', False):
            file_content = base64.b64decode(event['body'])
        else:
            print("ERROR: File must be base64 encoded")
            return {
                'statusCode': 400,
                'headers': {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*'
                },
                'body': json.dumps({'error': 'File must be base64 encoded'})
            }
        
        # Validate PDF format (check magic bytes)
        if not file_content.startswith(b'%PDF'):
            print(f"ERROR: Invalid PDF format - magic bytes check failed")
            return {
                'statusCode': 400,
                'headers': {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*'
                },
                'body': json.dumps({'error': 'File is not a valid PDF'})
            }
        
        # Check file size (limit to 10MB)
        file_size = len(file_content)
        max_size = 10 * 1024 * 1024  # 10MB in bytes
        if file_size > max_size:
            print(f"ERROR: File size {file_size} exceeds limit of {max_size} bytes")
            return {
                'statusCode': 413,
                'headers': {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*'
                },
                'body': json.dumps({'error': 'File size exceeds 10MB limit'})
            }
        
        # Generate unique filename with timestamp and UUID
        timestamp = datetime.utcnow().strftime('%Y%m%d_%H%M%S')
        unique_id = str(uuid.uuid4())[:8]
        filename = f"uploads/{timestamp}_{unique_id}.pdf"
        
        # Upload to S3
        s3_client.put_object(
            Bucket=bucket_name,
            Key=filename,
            Body=file_content,
            ContentType='application/pdf'
        )
        
        print(f"SUCCESS: File uploaded to s3://{bucket_name}/{filename}")
        
        # Return success response
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'message': 'File uploaded successfully',
                'filename': filename,
                'bucket': bucket_name,
                'size': file_size
            })
        }
        
    except Exception as e:
        # Log error details to CloudWatch
        print(f"ERROR: Unexpected error during file upload: {str(e)}")
        return {
            'statusCode': 500,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({'error': 'Internal server error'})
        }
