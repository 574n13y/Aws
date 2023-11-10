## Amazon EFS
sudo yum -y update
mkdir ~/efs-mount-point 

# Install EFS utils
sudo yum install -y amazon-efs-utils

# Mount using the EFS mount helper
sudo mount -t efs -o tls fs-0b051c875579db2d2.efs.us-east-1.amazonaws.com:/ ~/efs-mount-point

# Unmount the EFS file system
sudo umount ~/efs-mount-point
