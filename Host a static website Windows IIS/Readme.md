# Creating a Static Website in Windows Machine Using IIS

## I have used TF & Terraform cloud as backend to store tf files :-
- [main.tf]()
- [ami.tf]()
- [ec2.tf]()
- [output.tf]()
- [security-group.tf]()
- [variables.tf]()

```
terraform init
```

```
terraform plan
```

```
terraform apply
```
- [terraform-cloud-key.pem]() --- is my key pair

- RDP Machine 
  ![win](https://github.com/574n13y/Aws/assets/35293085/b4586c53-3d64-4969-9724-a7d7f79c742f)


- Create IIS for webhosting
- Click on Server Manager --> Click on Add Roles and Features
  ![IIS1](https://github.com/574n13y/Aws/assets/35293085/d6eb9117-f50f-4eb5-aaed-c6064be1a08b)

  ![IIS2](https://github.com/574n13y/Aws/assets/35293085/581dfe7e-ac73-4837-bd61-3d74eb13607c)

  ![IIS3](https://github.com/574n13y/Aws/assets/35293085/5c607185-5f7a-4915-903b-a1aa857b75d6)

  ![IIS4](https://github.com/574n13y/Aws/assets/35293085/233a7f71-9495-4fce-b847-a733f5dc21f1)


- Open File explorer and go to C:\inetpub\wwwroot\
- Create a Static web page or use templates, paste it here -   
  ![IIS5](https://github.com/574n13y/Aws/assets/35293085/d2779195-26d7-4df0-ae86-b3b7a3f02aa3)

- Open web browser on your local Machine or mobile/ any PDA devices
- use public IP address in browser
  ![IIS6](https://github.com/574n13y/Aws/assets/35293085/3dc7e6d4-6a25-45e2-aec1-0203f8460f5d)

- Destroy infra if required
  
  ```
  terraform destroy
  ```






