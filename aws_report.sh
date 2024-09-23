#!/bin/bash

########################################################################################################################################
                                                            #AWS CLI#
                                                            #Author - Stanley
                                                            #Version - 1.1
########################################################################################################################################
# Function to fetch EC2 Instances Report
generate_ec2_report() {
    echo "Fetching EC2 Instances Report..."
    aws ec2 describe-instances \
        --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,Tags[?Key==`Name`].Value]' \
        --output table > ec2_instances_report.txt
    echo "EC2 Instances Report generated: ec2_instances_report.txt"
}

# Function to fetch S3 Buckets Report
generate_s3_report() {
    echo "Fetching S3 Buckets Report..."
    aws s3 ls --summarize --human-readable --recursive > s3_buckets_report.txt
    echo "S3 Buckets Report generated: s3_buckets_report.txt"
}

# Function to fetch IAM Users Report
generate_iam_report() {
    echo "Fetching IAM Users Report..."
    aws iam list-users \
        --query 'Users[*].[UserName,UserId,CreateDate]' \
        --output table > iam_users_report.txt
    echo "IAM Users Report generated: iam_users_report.txt"
}

# Function to fetch CloudWatch Metrics Report
generate_cloudwatch_report() {
    echo "Fetching CloudWatch Metrics Report..."
    INSTANCE_IDS=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text)

    for INSTANCE_ID in $INSTANCE_IDS
    do
        aws cloudwatch get-metric-statistics \
            --metric-name CPUUtilization \
            --start-time $(date -u -d '-1 day' +"%Y-%m-%dT%H:%M:%SZ") \
            --end-time $(date -u +"%Y-%m-%dT%H:%M:%SZ") \
            --period 3600 \
            --namespace AWS/EC2 \
            --statistics Average \
            --dimensions Name=InstanceId,Value=$INSTANCE_ID \
            --output table >> cloudwatch_metrics_report.txt
    done
    echo "CloudWatch Metrics Report generated: cloudwatch_metrics_report.txt"
}

# Function to fetch AWS Cost and Usage Report
generate_cost_report() {
    echo "Fetching AWS Cost and Usage Report..."
    aws ce get-cost-and-usage \
        --time-period Start=$(date -d "$(date +%Y-%m-01) -1 month" +%Y-%m-%d),End=$(date +%Y-%m-01) \
        --granularity MONTHLY \
        --metrics "BlendedCost" "UnblendedCost" "UsageQuantity" \
        --group-by Type=DIMENSION,Key=SERVICE \
        --output table > aws_cost_usage_report.txt
    echo "AWS Cost and Usage Report generated: aws_cost_usage_report.txt"
}

# Function to fetch RDS Instances Report
generate_rds_report() {
    echo "Fetching RDS Instances Report..."
    aws rds describe-db-instances \
        --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,DBInstanceStatus]' \
        --output table > rds_instances_report.txt
    echo "RDS Instances Report generated: rds_instances_report.txt"
}

# Function to fetch Security Groups Report
generate_security_groups_report() {
    echo "Fetching Security Groups Report..."
    aws ec2 describe-security-groups \
        --query 'SecurityGroups[*].[GroupId,GroupName,Description,VpcId]' \
        --output table > security_groups_report.txt
    echo "Security Groups Report generated: security_groups_report.txt"
}

# Function to fetch Lambda Functions Report
generate_lambda_report() {
    echo "Fetching Lambda Functions Report..."
    aws lambda list-functions \
        --query 'Functions[*].[FunctionName,Runtime,Handler]' \
        --output table > lambda_functions_report.txt
    echo "Lambda Functions Report generated: lambda_functions_report.txt"
}

# Function to fetch EBS Volumes Report
generate_ebs_report() {
    echo "Fetching EBS Volumes Report..."
    aws ec2 describe-volumes \
        --query 'Volumes[*].[VolumeId,Size,State]' \
        --output table > ebs_volumes_report.txt
    echo "EBS Volumes Report generated: ebs_volumes_report.txt"
}

# Call all functions to generate reports
generate_ec2_report
generate_s3_report
generate_iam_report
generate_cloudwatch_report
generate_cost_report
generate_rds_report
generate_security_groups_report
generate_lambda_report
generate_ebs_report

echo "All AWS Service Reports have been generated."
