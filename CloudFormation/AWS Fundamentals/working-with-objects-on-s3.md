# Working with Objects on S3

- Upload object using the s3api (change bucket and path)
aws s3api put-object --bucket my-bucket --key my-object-key --body /path/to/local/file
- Download an object using the s3api (change bucket and path)
aws s3api get-object --bucket my-bucket --key my-object-key /path/to/local/file
- Use curl with a pre-signed URL to download an object (change bucket, path, and object)
curl -o /path/to/local/file "$(aws s3 pre sign s3://my-bucket/my-object-key --expires-in 3600)"
