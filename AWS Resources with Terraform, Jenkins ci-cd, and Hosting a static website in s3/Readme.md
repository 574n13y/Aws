# AWS Resources with Terraform, Jenkins ci-cd, and Hosting a static website in s3

   ![image](https://github.com/574n13y/Aws/assets/35293085/ac78fb9b-8eb0-41f5-898a-61f49ab8fd2e)

 - STATIC WEBSITE USING S3 FROM TERRAFORM
   ![image](https://github.com/574n13y/Aws/assets/35293085/7f530aee-cb7f-4381-a6c2-5af37f4ba900)

 - Tasks
   1. Setting up Terraform and Jenkins
   2. Integrating Jenkins and Terraform
   3. Creating the Terraform Scripts
   4. Running Two Application Containers with User Data
   5. Setting up Infrastructure State Management
   6. S3 Bucket for Terraform State
   7. DynamoDB Table for Locking

 - Prerequisites:
   1. AWS Account
   2. S3 Bucket for Terraform State
   3. Purpose: To securely store your Terraform state files remotely.
   4. DynamoDB Table for Locking Capability
   5. Jenkins setup
   6. Terraform Installation in Jenkins
   7. Terraform Files in Source Code Management (SCM)
   8. IAM Role for Jenkins EC2 Instance
   9. GitHub Repository
  

## Task 1 - Launch an Ubuntu(22.04) T2 Large Instance
  - Launch an AWS T2 Large Instance. Use the image as Ubuntu. You can create a new key pair or use an existing one. Enable HTTP and HTTPS settings in the Security Group and open all ports.

## Task 2 - Install Jenkins, Docker and Trivy
  - To Install Jenkins -> Connect to your console, and enter these commands to Install Jenkins
    ```
    vi jenkins.sh
    ```

    ```
    #!/bin/bash
    sudo apt update -y
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
    sudo apt update -y
    sudo apt install temurin-17-jdk -y
    /usr/bin/java --version
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
                  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                              /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install jenkins -y
    sudo systemctl start jenkins
    sudo systemctl status jenkins
    
    ```

    ```
    sudo chmod 777 jenkins.sh
    ./jenkins.sh
    ```
  - Once Jenkins is installed, we need to go to our AWS EC2 Security Group and open Inbound Port 8080, since Jenkins works on Port 8080.
  - Grab Public IP Address
  - Unlock Jenkins using an administrative password and install the suggested plugins.
  - Jenkins will now get installed and install all the libraries.
  - Create a user click on save and continue.
  - Jenkins Getting Started Screen.

## Task 3 - Install Docker
    ```
    sudo apt-get update 
    sudo apt-get install docker.io -y 
    sudo usermod -aG docker $USER 
    newgrp docker 
    sudo chmod 777 /var/run/docker.sock
    
    ```
  - After the docker installation, we create a sonarqube container (Remember to add 9000 ports in the security group).
    
    ```
    docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
    ```
  - Now our sonarqube is up and running
  - Enter username and password, click on login and change password
    ```
    username admin
    password admin
    ```
  - Update New password, This is Sonar Dashboard.
  - Install Trivy
    ```
    sudo apt-get install wget apt-transport-https gnupg lsb-release -y
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
    sudo apt-get update
    sudo apt-get install trivy -y
    ```

## Task 3 - Install Plugins like JDK, Sonarqube Scanner, Terraform
 - Install Plugin
 - Go to Manage Jenkins →Plugins → Available Plugins → Install below plugins
   1. Eclipse Temurin Installer (Install without restart)
   2. Eclipse Temurin Installer (Install without restart)
   3. Terraform
   ```
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform
   ```
   ```
   terraform --version
   which terraform
   ```
  - Configure Java and Terraform in Global Tool Configuration --> Go to Manage Jenkins → Tools → Install JDK(17) → Click on Apply and Save
  - Tools → Terraform -> Apply and save.
  - Configure Sonar Server in Manage Jenkins --> Grab the Public IP Address of your EC2 Instance, Sonarqube works on Port 9000, so <Public IP>:9000. Goto your Sonarqube Server. Click on Administration → Security → Users → Click on Tokens and Update Token → Give it a 
    name → and click on Generate Token.
  - copy Token → Goto Jenkins Dashboard → Manage Jenkins → Credentials → Add Secret Text. It should look like this
  - The Configure System option is used in Jenkins to configure different servers → Global Tool Configuration is used to configure different tools that we install using → Plugins We will install a sonar scanner in the tools.
  - In the Sonarqube Dashboard add a quality gate also Administration → Configuration → Webhooks → Click on Create → Add details
    `
    <http://jenkins-public-ip:8080>/sonarqube-webhook/
    `

## Task 4 -  Create an IAM, S3 bucket and Dynamo DB table
  - Navigate to AWS CONSOLE -> Click the “Search” field. -> Type “IAM enter” -> Click “Roles” -> Click “Create role” -> Click “AWS service”  -> Click “Choose a service or use case” -> Click “EC2” -> Click “Next”
  - Click the “Search” field. -> Add permissions policies -> AmazonEC2FullAccess -> Click the “Search” field. -> AmazonS3FullAccess -> Search -> AmazonDynamoDBFullAccess -> click Next -> Click the “Role name” field. -> Type “Jenkins-cicd” -> Click “Create role”
  - Click “EC2” -> go to the Jenkins instance and add this role to the Ec2 instance. -> select Jenkins instance → Actions → Security → Modify IAM role
  - Add a newly created Role and click on Update IAM role.
  - Search for S3 in console ->  “Create bucket”
  - Click the “Search” field. Search for DynamoDB and click on it.
  - Click “Create table”
  - Click the “Table name” field. enter “dynamodb_table = “mrcloudbook-dynamo-db-table”” -> Click the “Enter the partition key name” field. -> Type “LockID”



























 














       





 
