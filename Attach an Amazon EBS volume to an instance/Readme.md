# Attach an Amazon EBS volume to an instance
 - We can attach an available EBS volume to one or more of your instances that is in the same Availability Zone as the volume.

Let's Create an EC2 instance using Terraform.
 - [main.tf]()
 - [winkey.pem]()
   ![Capture1](https://github.com/574n13y/Aws/assets/35293085/f1d47516-e3bb-43e9-8bda-78a78b9d41f4)

 - use winkey.pem file to decrypt the password for the Windows machine.
 - Log in to the machine.
   ![Capture3](https://github.com/574n13y/Aws/assets/35293085/48d09940-fd23-4e97-a919-bf996e21ec06)


   
## To attach an EBS volume to an instance using the console
  - Open the Amazon EC2 console.
  - In the navigation pane, choose Volumes.
    ![Capture9](https://github.com/574n13y/Aws/assets/35293085/ff95b67f-89e4-41b6-a80f-6e3079e5263f)

  - Select the volume to attach and choose Actions, Attach volume.
    ![Capture11](https://github.com/574n13y/Aws/assets/35293085/35f650f3-059a-4903-8849-b2bcd0a75546)
    ![Capture10](https://github.com/574n13y/Aws/assets/35293085/26806d5a-6c0b-44ee-b58e-fa3e798943b9)
  - For Instance, enter the ID of the instance or select the instance from the list of options.
  - For the Device name, enter a supported device name for the volume. This device name is used by Amazon EC2. The block device driver for instance might assign a different device name when mounting the volume. For more information, see Device names on Linux instances.
  - Choose Attach volume.
    ![Capture12](https://github.com/574n13y/Aws/assets/35293085/ed1c336e-8b35-4328-91f4-dafb0e9511fb)
    ![Capture13](https://github.com/574n13y/Aws/assets/35293085/c66e1a7b-7822-43ed-94df-e8658ff75a7d)

  ## Connect to the instance and mount the volume.
  - In EC2 instance (windows machine) open the server manager -> click on File and Storage services -> click on Disks -> click on Volume recently added -> select Bring the Online option
    ![Capture4](https://github.com/574n13y/Aws/assets/35293085/167d33b1-17be-40c1-af09-40f5380d4917)
    ![Captur5](https://github.com/574n13y/Aws/assets/35293085/6c71cd6c-1f80-4c2b-81a7-9def165f45f1)
    ![Capture6](https://github.com/574n13y/Aws/assets/35293085/f537dd55-902c-412d-944c-66623226f7ca)
    
  - Mount the volume
    ![Capture7](https://github.com/574n13y/Aws/assets/35293085/a71adc6c-3726-4b9f-8ad2-59ab3359e50f)

  - Let's cross-check the drive on This PC.
    ![Capture8](https://github.com/574n13y/Aws/assets/35293085/7afa3a82-d57f-40bf-aad4-2c070539427f)

## We did it !!!

    

## AWS Tools for Windows PowerShell
   ```
   Add-EC2Volume -VolumeId vol-12345678 -InstanceId i-1a2b3c4d -Device /dev/sdh
   ```

   ```
   Add-EC2Volume
               -InstanceId <String>
               -VolumeId <String>
               -Device <String>
               -Select <String>
               -PassThru <SwitchParameter>
               -Force <SwitchParameter>
               -ClientConfig <AmazonEC2Config>
   ```
