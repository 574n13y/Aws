# Deploying a web-application using Nginx server and Reverse Proxy

- Architecture of Nginx
   ![image](https://github.com/574n13y/Aws/assets/35293085/52aed881-f89d-455b-bef1-d7f969eadb77)

  ![image](https://github.com/574n13y/Aws/assets/35293085/b6e561e7-946f-40de-ae37-d661c722b41c)

## Task 1
  - create an AWS EC2 instance. I have selected the Ubuntu image while creating the EC2 instance. Add inbound traffic rules for HTTP, and HTTPS.
  - After this SSH into the instance.
  - update the instance. Use command:-
     ```
     sudo apt-get update
     ```
  - need to install Nginx. Use command:
    ```
    sudo apt install nginx
    ```
  - Check if the Nginx is in a running state. Use command:
    ```
    systemctl status nginx
    systemctl restart nginx 
            (if asked for password do sudo systemctl restart nginx)
    ```
 - take the public IP of the server and try accessing it in a browser, to check if the Nginx is installed properly.
 - The above page is been accessed from /var/www/html
 - check the Nginx configuration files here:
   

   
