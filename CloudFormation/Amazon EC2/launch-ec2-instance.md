# Launch EC2 instance
aws ec2 run-instances --instance-type t2.micro --image-id AMI-ID --region us-east-1

# Describe EC2 instance
aws ec2 describe-instances --instance-ids INSTANCE-ID

# Terminate EC2 instance
aws ec2 terminate-instances --instance-ids INSTANCE-ID