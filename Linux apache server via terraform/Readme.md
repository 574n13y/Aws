# Creating Linux apache server via terraform

 - [ami.tf]() - machine type
 - [ec2.tf]() - number of instance
 - [main.tf]()
 - [output.tf]() - output 
 - [security-group.tf]() - ,security group, vpc 
 - [variables.tf]() - region, instance type 
 - [terraform-cloud-key.pem]() - Key pair

```
terraform init
```
   ![Screenshot from 2023-10-23 18-16-10](https://github.com/574n13y/Aws/assets/35293085/0b011e99-09c0-489f-93ed-d408376f0ace)

```
terraform plan
```
   ![Screenshot from 2023-10-23 18-16-19](https://github.com/574n13y/Aws/assets/35293085/2559e53c-1271-4604-bdc3-7d6ac2200c75)

```
terraform apply
```
   ![Screenshot from 2023-10-23 18-17-40](https://github.com/574n13y/Aws/assets/35293085/7182a5f3-b2ae-4911-aafa-019b3d9c47d3)
   ![Screenshot from 2023-10-23 18-17-44](https://github.com/574n13y/Aws/assets/35293085/292142f4-7fa0-496b-82ef-3b0d6ee513f6)

- Verify on console
  ![Screenshot from 2023-10-23 18-24-11](https://github.com/574n13y/Aws/assets/35293085/d42868a9-c62a-4292-bff8-81d0fd4e22fa)
  ![Screenshot from 2023-10-23 18-24-34](https://github.com/574n13y/Aws/assets/35293085/9863f8ce-b765-4ac9-8e02-a3827bd3e44b)

- Access instance via ssh
  ![Screenshot from 2023-10-23 18-26-35](https://github.com/574n13y/Aws/assets/35293085/065c7a1a-96c3-443f-83f0-a60e221f374c)

- Install httpd ie acache on machine
  ![Screenshot from 2023-10-23 18-27-17](https://github.com/574n13y/Aws/assets/35293085/dd2d1dc3-4037-4fcd-92af-517ff18e8cd6)

- check status
  ![Screenshot from 2023-10-23 18-29-28](https://github.com/574n13y/Aws/assets/35293085/d1368c50-3b2c-4e77-8d6b-5f6f35da61c7)

- start service
  ![Screenshot from 2023-10-23 18-30-26](https://github.com/574n13y/Aws/assets/35293085/98bf85df-ba4f-4873-8ca2-711194d983f5)

- Verify apache publicly
  ![Screenshot from 2023-10-23 18-31-00](https://github.com/574n13y/Aws/assets/35293085/917c1da3-04cf-4488-8325-e1514a5c8e87)
  ![Screenshot from 2023-10-23 18-31-51](https://github.com/574n13y/Aws/assets/35293085/17f7bbec-0779-4c95-a6d5-723cf0a7e1d6)

## How to Retrieve Metadata of Amazon linux machine
  ![Screenshot from 2023-10-23 19-12-40](https://github.com/574n13y/Aws/assets/35293085/b09b715c-cbf3-436b-8cc5-6dcee05ea68c)

- Destroying machine if required
  ```
  terraform destroy
  ```
  ![Screenshot from 2023-10-23 18-33-48](https://github.com/574n13y/Aws/assets/35293085/35ef98da-47f4-409d-9060-8c6f16121c7e)
  ![Screenshot from 2023-10-23 18-33-57](https://github.com/574n13y/Aws/assets/35293085/9cfa4383-7bf7-4537-b042-a6db76335b83)
  ![Screenshot from 2023-10-23 18-35-15](https://github.com/574n13y/Aws/assets/35293085/81c36a67-b8b0-4c1b-847e-adf6e86e62f4)






