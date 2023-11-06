# Retrieve Instance Metadata

Let's Create an EC2 instance.
 - [main.tf]()
   ![Capture](https://github.com/574n13y/Aws/assets/35293085/8eb08245-9384-4577-8213-4314f9d48d36)

 - Log in to the machine
   ![Capture1](https://github.com/574n13y/Aws/assets/35293085/6b992acd-7aea-4098-b3b2-72269e76434b)
   
 - lets try to retrieve metadata (which will give an error)
    ![Capture2](https://github.com/574n13y/Aws/assets/35293085/02c17054-2bb7-4627-ba09-545380e5bd1f)

## Using IMD5Sv1
 - let's fix this
 - select the machine -> click on action -> instance setting -> modify instance metadata options -> IMD5Sv2 -> optional -> save setting
   ![Capture3](https://github.com/574n13y/Aws/assets/35293085/a934d5c4-dd91-4be2-8543-50bd15fba5cd)

  for IPv4
   ```
   http://169.254.169.254/latest/meta-data/
   ```
  for IPv6
   ```
   http://[fd00:ec2::254]/latest/meta-data/
   ```
   ![Capture4](https://github.com/574n13y/Aws/assets/35293085/dc549b37-6340-4454-9380-783d6d0a40d5)
   ![Capture5](https://github.com/574n13y/Aws/assets/35293085/e627d078-909e-40f2-b559-65bf9e68369c)
   ![Capture6](https://github.com/574n13y/Aws/assets/35293085/8a6a44bf-ea9a-4c6a-a877-e788ed8e275b)

## Using IMD5Sv2
 - lets try the same thing with IMD5Sv2 options
 - select the machine -> click on action -> instance setting -> modify instance metadata options -> IMD5Sv2 -> Required -> save setting
   ![Capture7](https://github.com/574n13y/Aws/assets/35293085/4dbf3c0f-d819-483f-8064-bbb0d01e2b4b)

- use this command
  ```
  TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \ && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/
  ```
  ![Capture8](https://github.com/574n13y/Aws/assets/35293085/ff4a49cf-6bca-412b-9d0f-7a866d750494)
  ![Capture9](https://github.com/574n13y/Aws/assets/35293085/6a89e5bb-5b6b-4f84-a2fd-83009d1c1cb0)


 - lets try to get the available versions of the instance metadata 
   ```
   TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \ && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/
   ```
   ![Capture10](https://github.com/574n13y/Aws/assets/35293085/143d619b-403a-4f53-b347-57f4eaccfb8e)
   ![Capture11](https://github.com/574n13y/Aws/assets/35293085/d413fc20-4ae3-443a-8a27-f6e31b257d84)
   ![Capture12](https://github.com/574n13y/Aws/assets/35293085/027b676e-ea04-4608-ba68-b2367af3b77e)

  - for ami-id
     ```
     [ec2-user ~]$ curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/ami-id
     ```
  - for hostname
    ```
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/local-hostname
    ```
 
   You can find more commands to retrieve metadata using IMD5Sv2 here [IMD5Sv2.sh]()

   





