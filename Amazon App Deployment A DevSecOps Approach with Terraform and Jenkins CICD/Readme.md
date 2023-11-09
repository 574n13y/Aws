# Amazon App Deployment: A DevSecOps Approach with Terraform and Jenkins CI/CD

  - ## Step1: create an IAM user
     Navigate to the AWS console
     Click the “Search” field.
     Search for IAM
     Click “Users”
     Click “Add users”
     Click the “User name” field.
     Type “Terraform” or as you wish about the name
     Click Next
     Click “Attach policies directly”
     Click this checkbox with Administrator access
     Click “Next”
     Click “Create user”
     Click “Security credentials”
     Click “Create access key”
     Click Next

    ## Step2: Aws Configure
     Provide your Aws Access key and Secret Access key
     
    ## Step3: Terraform files and Provision Jenkins, sonar
     main.tf
       This will install Jenkins and Docker and Sonarqube and trivy

      - Terraform commands to provision

      - Unlock Jenkins using an administrative password and install the suggested plugins.

      - Jenkins will now get installed and install all the libraries.

      - Copy your Public key again and paste it into a new tab

      - Use the same IP coz we are running on the same machine

      - Now our sonarqube is up and running

     - Enter username and password, click on login and change password

     - Update New password, This is Sonar Dashboard.

     - Check trivy version

## Step 4 — Install Plugins like JDK, Sonarqube Scanner, NodeJs, OWASP Dependency Check
   - Install Plugin
   - Goto Manage Jenkins →Plugins → Available Plugins →
   - Install below plugins
    1 → Eclipse Temurin Installer (Install without restart)
    2 → SonarQube Scanner (Install without restart)
    3 → NodeJs Plugin (Install Without restart)


   - Configure Java and Nodejs in Global Tool Configuration
   - Goto Manage Jenkins → Tools → Install JDK(17) and NodeJs(16)→ Click on Apply and Save


## Step 5 — Configure Sonar Server in Manage Jenkins
   - Grab the Public IP Address of your EC2 Instance, Sonarqube works on Port 9000, so <Public IP>:9000. Goto your Sonarqube Server. Click on Administration → Security → Users → Click on Tokens and Update Token → Give it a name → and click on Generate Token
   - click on update Token
   - Create a token with a name and generate
   - copy Token
   - Goto Jenkins Dashboard → Manage Jenkins → Credentials → Add Secret Text. It should look like this
