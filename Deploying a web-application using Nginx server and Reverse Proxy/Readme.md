# Deploying a web application using Nginx server and Reverse Proxy

 Architecture of Nginx - <br>
  ![image](https://github.com/574n13y/Aws/assets/35293085/52aed881-f89d-455b-bef1-d7f969eadb77)
 

 Flowchart - <br>
  ![image](https://github.com/574n13y/Aws/assets/35293085/b6e561e7-946f-40de-ae37-d661c722b41c)


## Task 1
  - create an AWS EC2 instance. I have selected the Ubuntu image while creating the EC2 instance. Add inbound traffic rules for HTTP, and HTTPS.
    ![1](https://github.com/574n13y/Aws/assets/35293085/e430d0ec-5e05-48ad-b0c8-dc1b51405819)

  - After this SSH into the instance.
    ![2](https://github.com/574n13y/Aws/assets/35293085/918ae27e-2961-4afa-a9ec-605916eadbf3)
    
  - update the instance. Use the command:-

     ```
     sudo apt-get update
     ```
     ![3](https://github.com/574n13y/Aws/assets/35293085/ce78cdd3-c9a2-42ce-b886-c3d8e289bfe5)

  - need to install Nginx. Use command:
    ```
    sudo apt install nginx
    ```
    ![4](https://github.com/574n13y/Aws/assets/35293085/12f5f992-cc6c-4c83-9e63-474c1b3a79af)

  - Check if the Nginx is in a running state. Use command:
    ```
    systemctl status nginx
    systemctl restart nginx 
            (if asked for password do sudo systemctl restart nginx)
    ```
    ![5](https://github.com/574n13y/Aws/assets/35293085/c4433d06-a3a2-4ec8-843c-505b87365a2c)
    ![6](https://github.com/574n13y/Aws/assets/35293085/d8a91a8a-a577-42fd-b670-8744846abb03)

 - take the public IP of the server and try accessing it in a browser, to check if the Nginx is installed properly.
 - The above page is been accessed from /var/www/html
 - check the Nginx configuration files here:
 - To deploy some applications you can go to /var/www/html create an index.html file and add your html code and you can access the same using the public IP of the server.
 - Check on the browser by entering the IP address. You will see below home page below.
   
## Task 2
  - clone the source code repository. Use command:
    ```
    git clone https://github.com/574n13y/django-notes-app.git
    ```
  - install docker. Use command:
    ``
    sudo apt install docker.io
    ``
  - Check docker status:
  - check if docker is working fine.
  - Permission denied because this user doesn’t have access to docker. So we will give this user permission. Use command:
    ```
    sudo usermod -aG docker $USER

    $USER == current logged in user
    ```
  - After this reboot the server.
    ``
    sudo reboot
    ``
  - Here is the Dockerfile :
    ```
    FROM python:3.9
    
    WORKDIR /app/backend
    
    COPY requirements.txt /app/backend
    
    RUN pip install -r requirements.txt
    
    COPY . /app/backend
    
    EXPOSE 8000
    
    CMD python /app/backend/manage.py runserver 0.0.0.0:8000
    ```
  - Now we will start the build process of the application. Use command :
    ```
    docker build -t notes-app .
    ```
  - The image has been created successfully.
  - Now using this image we will create a container. Use the below command:
    ``
    docker run -d -p 8000:8000 notes-app:latest
    ``
  - Now do #docker ps and check if the container is created properly and it has been tagged to the 8000 port so that we can access the same on that port.
  - This application is now running on the local host and we can check it using the command:
    ```
    curl -L <local_url>:<External-Ip>
    curl -L http://127.0.0.1:8000
    ```

## Task 3
  - we want to give access to the application by using the concept of reverse proxy so that the clients can access the same.
  - For this, we need to change the configuration of Nginx so for that go to /etc/nginx/sites-enabled
  - Now we will update the default file for changing the configuration.
  - Here we have added a proxy address for the incoming traffic.
  - After adding this we need to restart the nginx so that the updates will work. Use the below command to restart Nginx.
    ```
    sudo service nginx restart
    ```
  - Now you can access the application using the IP address.
  - Now the app is accessible but we are not able to update or delete the notes here because the backend code is not updated here to store such data.
  - For this, we need to copy all the static files of the application to the location Nginx root folder /var/www/html so that we can access it.
  - Use the command :
    ```
    sudo cp -r * /var/www/html/
    ```
  - Now we need to update the location /API for the backend page of the server. Go to /etc/nginx/sites-enabled location and update the code.
  - Save it and you need to restart the service.
  - After restarting you can go on the browser and check accessing the notes app and try adding your notes to it. You will be able to do that.
  - In this way, we did deploy our web application using the Nginx server.

    
                     *** ***  ******************************  *** ***










   
