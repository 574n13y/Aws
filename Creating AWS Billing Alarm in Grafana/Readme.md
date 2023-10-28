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


