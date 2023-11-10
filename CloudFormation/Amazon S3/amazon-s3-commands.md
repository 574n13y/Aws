# Create an Amazon S3 bucket
aws s3 mb s3://mynewbucket

# List S3 buckets
aws s3 ls

# Upload a file to the S3 bucket
aws s3 cp mytestfile s3://mynewbucket

# List contents of the S3 bucket
aws s3 ls s3://mynewbucket

# Delete the S3 bucket
aws s3 rb --force s3://mynewbucket


