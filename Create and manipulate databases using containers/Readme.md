# Create and manipulate databases using containers

The particularity of ECS is that the service needs either Fargate or EC2 in order to run its containers. Here it will be the EC2 service that will be used because it is part of the Free Tier unlike Fargate. Other services will be used (EFS, EBS) but will be detailed later in the project.
Finally, it will be necessary to manage the access to the resources, so that:
- Resources requiring public access are in a public subnet;
- Resources that need to be accessible only internally are in a private subnet.
Once this is done, this is what the project infrastructure will look like:
  ![DB](https://github.com/574n13y/Aws/assets/35293085/1a91f9c0-09c0-4c8a-9cb8-6e7ece68b390)
  ![req](https://github.com/574n13y/Aws/assets/35293085/f3b9a22f-f28b-4818-8bc9-a764f74c141a)

- Create a VPC & Subnets
  ![Screenshot from 2023-10-27 12-46-16](https://github.com/574n13y/Aws/assets/35293085/baa843d6-6215-4c2c-a100-4803411ce14f)
  ![Screenshot from 2023-10-27 12-47-22](https://github.com/574n13y/Aws/assets/35293085/a3eff949-0857-4383-8c88-eeb0cc617d75)
  ![Screenshot from 2023-10-27 12-48-07](https://github.com/574n13y/Aws/assets/35293085/783ee7f9-6c60-44b4-b316-5629aae07760)
  ![Screenshot from 2023-10-27 12-48-14](https://github.com/574n13y/Aws/assets/35293085/577948b7-a0d7-415a-b97d-175c03e5b89e)

- Create a RDS MySQL database
  ![Screenshot from 2023-10-27 12-50-14](https://github.com/574n13y/Aws/assets/35293085/b70a6a8b-7e31-46fd-a01e-4e72451656db)
  ![Screenshot from 2023-10-27 12-50-41](https://github.com/574n13y/Aws/assets/35293085/c6ab3a48-58a8-4a05-baaa-5b063a663306)
  ![Screenshot from 2023-10-27 12-51-05](https://github.com/574n13y/Aws/assets/35293085/a687e3e7-bc47-43ac-950c-3d9a3b3fc844)
  ![Screenshot from 2023-10-27 12-53-40](https://github.com/574n13y/Aws/assets/35293085/97b605d4-655f-4bc8-8fd1-ae6bb319f6f0)
  ![Screenshot from 2023-10-27 12-54-28](https://github.com/574n13y/Aws/assets/35293085/339af2c3-0a0b-48b6-8e2c-fa8ce55473b4)

- Deploy a ECS Cluster in EC2
  ![Screenshot from 2023-10-27 12-56-09](https://github.com/574n13y/Aws/assets/35293085/b4bbe4f6-218e-4bcf-9938-158e77cb1ace)
  ![Screenshot from 2023-10-27 12-57-27](https://github.com/574n13y/Aws/assets/35293085/165acb7e-03aa-4202-aa6f-ba1727026d3b)
  ![Screenshot from 2023-10-27 12-59-46](https://github.com/574n13y/Aws/assets/35293085/44888dcb-5bb8-45b4-addc-e35bc05d2b9c)
  ![Screenshot from 2023-10-27 13-00-16](https://github.com/574n13y/Aws/assets/35293085/aed92f95-8d8e-4986-8298-72f3376f8474)
  ![Screenshot from 2023-10-27 13-00-44](https://github.com/574n13y/Aws/assets/35293085/3286d49b-1e50-4990-b309-a427431dca8d)
  ![Screenshot from 2023-10-27 13-00-47](https://github.com/574n13y/Aws/assets/35293085/eba5304c-c190-4903-b427-b4f225d9f0e1)
  ![Screenshot from 2023-10-27 13-01-44](https://github.com/574n13y/Aws/assets/35293085/f02c96a6-1cc4-453a-a498-84541bf0fb96)
  ![Screenshot from 2023-10-27 13-04-12](https://github.com/574n13y/Aws/assets/35293085/dbec307a-154f-4a27-a114-ec2adbbc378f)
  ![Screenshot from 2023-10-27 13-06-11](https://github.com/574n13y/Aws/assets/35293085/9a2ab54a-d7e3-4d8b-93a4-1fa9792edc9e)
  
- Task Definition for phpMyAdmin DBMS container
  ![Screenshot from 2023-10-27 13-07-31](https://github.com/574n13y/Aws/assets/35293085/992802e0-71d8-47e8-bd5a-bffd904f54dd)
  ![Screenshot from 2023-10-27 13-08-53](https://github.com/574n13y/Aws/assets/35293085/40c177d5-c167-4fff-99e2-53c2c6776df7)
  ![Screenshot from 2023-10-27 13-09-38](https://github.com/574n13y/Aws/assets/35293085/73875bee-76d2-434e-9367-522b1a791f24)
  ![Screenshot from 2023-10-27 13-10-39](https://github.com/574n13y/Aws/assets/35293085/827dcd1c-be20-40cc-807b-c1c1c9da92f7)
  ![Screenshot from 2023-10-27 13-10-55](https://github.com/574n13y/Aws/assets/35293085/a0809045-474d-484e-98c0-aab644cb03c8)
  ![Screenshot from 2023-10-27 13-12-29](https://github.com/574n13y/Aws/assets/35293085/b05905c2-ada6-4f2a-b770-33df8af8a3b6)
  ![Screenshot from 2023-10-27 13-16-35](https://github.com/574n13y/Aws/assets/35293085/e7c71c56-c56a-4553-a837-7a99e0d1b003)
  ![Screenshot from 2023-10-27 13-20-11](https://github.com/574n13y/Aws/assets/35293085/cd1ce61d-909b-47d7-bfc0-9592bccb2b37)
  ![Screenshot from 2023-10-27 13-20-30](https://github.com/574n13y/Aws/assets/35293085/21d61a48-5285-42ce-833f-b6e1af73b654)
  ![Screenshot from 2023-10-27 13-44-43](https://github.com/574n13y/Aws/assets/35293085/45e960ec-980f-421d-9a07-faf4f19746d2)
  ![Screenshot from 2023-10-27 13-44-31](https://github.com/574n13y/Aws/assets/35293085/e67f011d-33e4-4eb6-858b-e48566848b44)
 
- Task Definition for Metabase visualization tool container
  ![Screenshot from 2023-10-27 13-47-18](https://github.com/574n13y/Aws/assets/35293085/e5f1fb64-8616-4bd1-be19-4b4372fd8dd4)
  ![Screenshot from 2023-10-27 14-32-12](https://github.com/574n13y/Aws/assets/35293085/8402b99b-46c8-4b7f-b437-b3d57069d6e3)
  ![image](https://github.com/574n13y/Aws/assets/35293085/e7af1561-0d87-414e-846b-60aabd68c124)
  ![image](https://github.com/574n13y/Aws/assets/35293085/e5ec0f10-62bd-4949-82a3-1ebeea1ee98e)
  ![image](https://github.com/574n13y/Aws/assets/35293085/4426163b-5f81-4781-97ac-8d09cefe6354)
  ![image](https://github.com/574n13y/Aws/assets/35293085/4e46449c-940a-4d88-ba66-a6c2ab2b23b5)

- Add EFS to Metabase container
  ![image](https://github.com/574n13y/Aws/assets/35293085/b60d35f9-1eae-440a-9c2f-99f43f375a74)
  ![image](https://github.com/574n13y/Aws/assets/35293085/8a490ae1-2579-49eb-9d97-9b9e121fa5c7)
  ![image](https://github.com/574n13y/Aws/assets/35293085/00bbce13-7cd9-4f0e-b1b3-d0ca0bf202e4)
  ![image](https://github.com/574n13y/Aws/assets/35293085/5b4818e3-ff44-461d-a9c7-661f341664f3)
  ![image](https://github.com/574n13y/Aws/assets/35293085/edd31dc3-3d3d-4313-969b-438d42faa813)
  ![image](https://github.com/574n13y/Aws/assets/35293085/a9b7073f-bdc1-498d-a791-824a795fdfff)
  ![image](https://github.com/574n13y/Aws/assets/35293085/e55974c5-74c5-4919-b223-46694d73c029)
  ![image](https://github.com/574n13y/Aws/assets/35293085/51f00dbd-01b9-4c75-be42-dc78cb89487f)
  ![image](https://github.com/574n13y/Aws/assets/35293085/d0a71938-27bd-48e6-8375-f1cc77b72304)

  
