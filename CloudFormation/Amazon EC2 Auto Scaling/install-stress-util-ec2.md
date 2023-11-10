# Enable the EPEL repo:
sudo amazon-linux-extras install epel -y

# Install the stress utility
sudo yum install stress -y

# Run the stress utility with x number of CPU workers
sudo stress --cpu 5