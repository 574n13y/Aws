# Deploying a Django notes app on an EC2 instance using Jenkins declarative CI/CD pipeline.

## Will leverage Docker containers and Docker Hub for containerization and image management. This project focuses on automating the deployment process, ensuring seamless integration and delivery of the application.

- create a new instance. 
- Name: Ubuntu
- AMI: ubuntu.
- Instance type: t2.micro (free tier).
- Key pair login: Create > docker.pem.  - (Download the .pem file.)
- Allow HTTP.
- Allow HTTPS.

 - Click on Launch Instance, then connect to the EC2 instance and install the following packages
   ![dev1](https://github.com/574n13y/Aws/assets/35293085/766ccb13-ef1d-43e3-a1f6-3b23b5f53234)

 - Docker installation
   ![dev2](https://github.com/574n13y/Aws/assets/35293085/4bdbe08b-b2d7-418f-9350-ad3165838e68)

 - Openjdk-17-jre installation
   ```
   sudo apt install openjdk-17-jre
   ```
   ![dev3](https://github.com/574n13y/Aws/assets/35293085/5fb1dc19-6ef4-453f-ac3e-8219a7e58e21)

 - Jenkins installation
   ```
   sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
     https://pkg.jenkins.io/debian/jenkins.io-2023.key
   echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
     https://pkg.jenkins.io/debian binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null
   sudo apt-get update
   sudo apt-get install jenkins
   ```
 - Docker compose installation
   ```
   sudo apt-get install docker-compose
   ```
- Run the following commands to add users to the Docker group:
  ```
  sudo usermod -aG docker $USER
  sudo usermod -aG docker jenkins
  sudo reboot
  ```
  ![dev4](https://github.com/574n13y/Aws/assets/35293085/59b2b6cf-3838-4f67-9d4c-039e2d44a1f0)
  
- Verify versions
  ![dev5](https://github.com/574n13y/Aws/assets/35293085/d32dd8e8-b7de-43c2-a74a-97dcc21964ee)

- we will allow “Inbound Rule” ports 8080 and 8000 for this machine from a security group.
  ![dev6](https://github.com/574n13y/Aws/assets/35293085/37154801-86b3-4db0-b457-7330f491ec76)

- Copy the Public Ip of the machine and paste it to the browser to access the Jenkins portal.
  ![dev7](https://github.com/574n13y/Aws/assets/35293085/2d155e05-be53-4b7e-8a78-2016fc7f28ec)

- We need an Administrator Password to unlock this. Run the following command
  ```
  cat /var/lib/jenkins/secrets/initialAdminPassord
  ```
  ![dev8](https://github.com/574n13y/Aws/assets/35293085/7e95c793-b099-4901-a237-a0a384ee199f)
  ![dev9](https://github.com/574n13y/Aws/assets/35293085/a1277577-ce42-4a52-a053-440a1c56c27d)

- Click on, “Install Suggested Plugins”
  ![dev10](https://github.com/574n13y/Aws/assets/35293085/b3a9eed1-26e7-43d0-a6c1-81e8ea3bb16d)
  ![dev11](https://github.com/574n13y/Aws/assets/35293085/7a834570-8ed3-4cb7-b8c4-f37d470622e3)

- Jenkins will ask us to create the First Admin User.
- You can get Jenkins homepage.
  ![dev12](https://github.com/574n13y/Aws/assets/35293085/4c6bdbb0-11b1-43bb-b41c-427052140f83)

- From Jenkins Dashboard, Click on “New Item”.
  ![dev13](https://github.com/574n13y/Aws/assets/35293085/9c1b0b89-e917-4675-9daf-01460dcaa8ab)

- Add the name as
  ```
  Name: first-cicd-pipe
  Project: Pipeline
  Click “Ok”.
  ```
  ![dev14](https://github.com/574n13y/Aws/assets/35293085/cab1c42f-f682-4562-85a9-2e339e373b85)

- we have to configure the pipeline as follows
-   Dashboards > notes-app-cicd > configuration > general
-   Check✅Github project
-   Github project link
-   Check ✅GitHub hook trigger for GITScm polling
-   Put this basic Declarative pipeline code in a script dialog box
  ```
    pipeline {
      agent any

       stages {
          stage('Clone Code') {
             steps {
                 echo 'Cloning the code'
             }
          }
         stage('Build') {
             steps {
                 echo 'This is Build Stage'
             }
         }
         stage('Push to Docker hub') {
             steps {
                 echo 'This is Test stage'
              }
          }
         stage('Deployement') {
             steps {
                 echo 'Deploying container'
                  }
          }
       }
      }
  ```   
- Click on the Save button and start the build on the pipeline page
  ![dev15](https://github.com/574n13y/Aws/assets/35293085/2c0707e1-2fd4-45d9-a508-7aae778e7051)
  ![dev16](https://github.com/574n13y/Aws/assets/35293085/998b9f98-6bdb-4862-8efe-112a04a74686)
  ![dev17](https://github.com/574n13y/Aws/assets/35293085/e19e8c1d-9b1b-4aa4-a1dd-b1f7e5ae01e0)
  ![dev19](https://github.com/574n13y/Aws/assets/35293085/92cb6021-d2de-443e-9c8a-879d0962e7b9)
  ![dev20](https://github.com/574n13y/Aws/assets/35293085/cdb9323f-88d4-4de2-987a-5fbdb5530d36)




