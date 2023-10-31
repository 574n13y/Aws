


# Creating AWS Billing Alarm in Grafana

## Task - Setup Grafana Monitoring for EC2 instance
   - Create an EC2 instance in your AWS environment.
   - Setup Grafana cloud console.
   - On the Grafana cloud home page, navigate to the "connect Data" section.
   - In the dashbord, click on AWS to access setup things for aws account.
   - In select Cloudwatch metrics for integration between AWS and Grafana Cloud.
   - For CloudWatch integration we will create AWS IAM Role.
   - After successfully integration now we can go to homepage and open dashboard and select CloudWatch Metrics dashboard.
   - We can get visualized dashboards with real time tracking data. 

## After setting up dashboards for aws we have to setup Alerts for CPU utilization
   - When CPU is processing with 75% we have to get alert for this situation
   - For this we have to set 3 main things
      1. Alert rules: In Alert rule we have to write query for data.
      2. Contact points: In Contact point we have to put alerting email addresses.
      3. Notification policies: In this we have to write triggering points when alerts have to generate and notifications want to send.
   - Click for Create alert rule for CPU utilization is above 75%

   - Select metric as_ec2_cpuutilization_maximum then slect instance id then select threshold value to 75%.
   - Now Run the query and check output.
   - Now all set then click on Save rule.
   - Now we have to configure alerting emails click on manage contact points.
   - Click on edit the grafana-default-email.
   - Put your email address in address field and click on Test for verification.
   - You will get a Test alert mail.
   - When any alert was triggers you will get email like this.
   - Now setting up notification policies click on manage notification policies.

   - Select Label and value for notification then select contact point which was previously created.
   - The first task is done Now let’s do the second task.
   - In this Task we have to set alert for you don’t spend too much money on aws services.
   - Select Manage alert rule.
   - Select matrics aws_billing_estimated_charges_average and sum of them.
   - Select thread as 10$.
   - Add new notification policy for billing above 10$.
   - Here is both alerts are set for aws ec2 instance if the conditions triggered then you will get mail from alert system.





# Here is our Today’s Task-01 :

## Setup Grafana cloud
   - Go to the link https://www.grafana.com/ and create an account.
   - Now you can see Home Page of Grafana.
   - Now Connect your desired data sources to Grafana Cloud. This could include Prometheus, InfluxDB, Elasticsearch, or other compatible data sources.
   - Click Here and Follow Task 03 For next steps.
   - We already created visualized dashboard in our previous story.
   - Grafana Alerting is a game-changer in the world of monitoring. With its seamless integration into Grafana’s powerful UI and the ability to leverage various data sources, it empowers teams to proactively detect and address issues in their systems.
   - By following the tasks outlined in this blog, you’ve taken the first steps towards harnessing the full potential of Grafana Alerting. Stay tuned for more monitoring insights and tips as we continue our journey towards mastering the art of monitoring!




# Amazon App Deployment: A DevSecOps Approach with Terraform and Jenkins CI/CD

  - Step1: create an IAM user
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

  - Step2: Aws Configure
     Provide your Aws Access key and Secret Access key
     
  - Step3: Terraform files and Provision Jenkins,sonar
     main.tf
       This will install Jenkins and Docker and Sonarqube and trivy

Terraform commands to provision

Unlock Jenkins using an administrative password and install the suggested plugins.

Jenkins will now get installed and install all the libraries.

Copy your Public key again and paste it into a new tab

Use same ip coz we are running on same machine

Now our sonarqube is up and running

Enter username and password, click on login and change password

Update New password, This is Sonar Dashboard.

Check trivy version

## Step 4 — Install Plugins like JDK, Sonarqube Scanner, NodeJs, OWASP Dependency Check
Install Plugin
Goto Manage Jenkins →Plugins → Available Plugins →
Install below plugins
1 → Eclipse Temurin Installer (Install without restart)
2 → SonarQube Scanner (Install without restart)
3 → NodeJs Plugin (Install Without restart)


Configure Java and Nodejs in Global Tool Configuration
Goto Manage Jenkins → Tools → Install JDK(17) and NodeJs(16)→ Click on Apply and Save


## Step 5 — Configure Sonar Server in Manage Jenkins
Grab the Public IP Address of your EC2 Instance, Sonarqube works on Port 9000, so <Public IP>:9000. Goto your Sonarqube Server. Click on Administration → Security → Users → Click on Tokens and Update Token → Give it a name → and click on Generate Token
click on update Token
Create a token with a name and generate
copy Token
Goto Jenkins Dashboard → Manage Jenkins → Credentials → Add Secret Text. It should look like this
