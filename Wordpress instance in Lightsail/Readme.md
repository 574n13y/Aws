# WordPress instance in Lightsail

## Step 1: Create an Amazon Lightsail account

## Step 2: Create a WordPress instance in Lightsail
   - Sign in to the Lightsail console.
   - On the Instances tab of the Lightsail home page, choose Create instance.
   - An AWS Region and Availability Zone is selected for you. Choose Change AWS Region and Availability Zone if you want to create your instance in another location.
   - Choose your instance image.
     a. Choose Linux/Unix as the platform.
     b. Choose WordPress as the blueprint.
   - Choose an instance plan.
      A plan includes a machine configuration (RAM, SSD, vCPU) at a low, predictable cost, and data transfer allowance. You can try the $3.50 USD Lightsail plan without charge for three months (up to 750 hours). AWS credits the first three months to your account.
   - Enter a name for your instance and choose Create instance.
     a. Must be unique within each AWS Region in your Lightsail account.
     b. Must contain 2 to 255 characters.
     c. Must start and end with an alphanumeric character or number.
     d. Can include alphanumeric characters, numbers, periods, dashes, and underscores.
     ![wp1](https://github.com/574n13y/Aws/assets/35293085/eaa93596-a019-4fcd-bdc9-47ccfd1e96c6)

## Step 3: Connect to your instance via SSH and get the password for your WordPress website
   -  On the Instances tab of the Lightsail home page, choose the SSH quick-connect icon for your WordPress instance.
   -  After the browser-based SSH client window opens, enter the following command to retrieve the default application password:
      ```
      cat $HOME/bitnami_application_password
      ```
   -  Make note of the password displayed on the screen. You use it later to sign in to the administration dashboard of your WordPress website.
      ![wp2](https://github.com/574n13y/Aws/assets/35293085/35407c45-7dc3-43a7-88e3-2e378dbfe4b0)
      ![wp3](https://github.com/574n13y/Aws/assets/35293085/11821ad9-ecaf-4640-8fe2-221de426650e)

## Step 4: Sign in to the administration dashboard of your WordPress website
   - In a browser, go to:
     ```
     http://PublicIpAddress/wp-login.php
     ```
     ![wp4](https://github.com/574n13y/Aws/assets/35293085/56989847-6585-4fb1-83a0-ceac31b64731)

   - Log in to your instance.
     a. In the Username or Email Address box, enter user
     b. In the Password box, enter the default password obtained.
     c. Choose Log in.
     ![wp5](https://github.com/574n13y/Aws/assets/35293085/96e18509-7a97-4d61-963f-256570ebbd2b)

   - we are now signed in to the administration dashboard of your WordPress website where we can perform administrative actions.
     ![wp6](https://github.com/574n13y/Aws/assets/35293085/ab5c64eb-d394-43f2-9b51-e3375e251f75)
     ![wp7](https://github.com/574n13y/Aws/assets/35293085/54aace2f-3cef-4e7e-a74a-0308bd6d3de5)


## Step 5: Create a Lightsail static IP address and attach it to your WordPress instance
   - On the Instances tab of the Lightsail home page, choose your running WordPress instance.
   - Choose the Networking tab, then choose Create static IP.
   - The static IP location is preselected based on the instance zone that you chose earlier. Select the created WordPress instance from the Attach to an instance dropdown.
   - Name your static IP, then choose Create.
     ![wp8](https://github.com/574n13y/Aws/assets/35293085/79063455-7c95-4465-89a7-cf6c05390de3)
     ![wp9](https://github.com/574n13y/Aws/assets/35293085/58f731c9-1679-409d-b2dc-87fb89ac3d7f)

## Step 6: Create a Lightsail DNS zone and map a domain to your WordPress instance
   - On the Networking tab of the Lightsail home page, choose Create DNS zone.
     ![wp10](https://github.com/574n13y/Aws/assets/35293085/817ca046-baff-4772-9b16-0736c1d76574)

   - Enter your domain, then choose Create DNS zone.
     ![wp11](https://github.com/574n13y/Aws/assets/35293085/77400c2c-5d12-45ec-bbd1-bcd19278bb8f)

   - Make note of the name server address listed on the page.
     You add these name server addresses to your domain name’s registrar to transfer management of your domain’s DNS records to Lightsail.
     ![wp12](https://github.com/574n13y/Aws/assets/35293085/d9d719cd-dad5-49f6-a80c-7c14e49ac529)

   - After the management of your domain’s DNS records is transferred to Lightsail, add an A record to point the apex of your domain to your WordPress instance, as follows:
      You add these name server addresses to your domain name’s registrar to transfer management of your domain’s DNS records to Lightsail.
      In the DNS zone for your domain, choose Add record.
      ![wp13](https://github.com/574n13y/Aws/assets/35293085/1314ef24-8f13-4088-9e83-32b7e1cc9b3b)

   - Continue adding the following details to complete pointing the apex of your domain to your WordPress instance:
     a. In the Subdomain box, enter an @ symbol to map the apex of your domain (such as example.com) to your instance. The @ symbol explicitly symbolizes that you’re adding an apex record. It is not added as a subdomain.
     b. In the Resolves to box, choose the static IP that you attached to the WordPress instance
     c. Choose the green save icon.
       Allow time for the change to propagate through the internet's DNS before your domain begins routing traffic to your WordPress instance.
       ![wp14](https://github.com/574n13y/Aws/assets/35293085/cadf1c77-b3fe-46cf-96fb-506283da1b39)

       ![wp15](https://github.com/574n13y/Aws/assets/35293085/637aadef-e47d-4519-9c67-2679957e0d94)
       ![wp16](https://github.com/574n13y/Aws/assets/35293085/4a8f0672-f5a4-4f86-9aef-0bc8a920670d)




## Step 7: Delete / Clean up
   - On the Instances tab of the Lightsail home page, choose the ellipsis (⋮) icon next to the WordPress instance you just created and choose Delete.
   - Choose Yes, delete from the prompt.
     ![wp17](https://github.com/574n13y/Aws/assets/35293085/b5380c1f-032e-4b65-b989-90dd04a39478)
     ![wp18](https://github.com/574n13y/Aws/assets/35293085/ba91be04-139f-4d2c-8bad-bc4679554f09)


## Amazon Lightsail to launch and deploy a WordPress instance. Amazon Lightsail is a great choice for developing, building and deploying a variety of applications like WordPress, websites, and blog platforms.
