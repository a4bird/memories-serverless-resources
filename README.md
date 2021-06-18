# memories-serverless-resources

A repository for creating serverless resources for Memories on AWS.
This would include any resources which are common to memories

This includes
- Network Configuration such as VPC, Subnets etc
- An S3 Bucket for storing assets. This bucket would have a trigger notification to SQS. 
This event would be raised whenever a new image is uploaded to 
- An SQS as the destination of trigger event from S3 bucket
