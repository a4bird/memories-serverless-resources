# memories-serverless-resources

A repository for creating serverless resources for Memories on AWS.
This would include any resources which are common to memories however it wouldn't include projects infrastructure resources
such as VPC, Network, Subnets, Lambda-Bucket etc.

This includes
- An S3 Bucket for storing assets. This bucket would have a trigger notification to SQS. 
- DynamoDb Table to store records
This event would be raised whenever a new image is uploaded to 
- An SQS as the destination of trigger event from S3 bucket
