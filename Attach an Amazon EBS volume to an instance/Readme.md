# Attach an Amazon EBS volume to an instance
 - We can attach an available EBS volume to one or more of your instances that is in the same Availability Zone as the volume.

Let's Create an EC2 instance.
 - [main.tf]()
   

 - Log in to the machine
   
## To attach an EBS volume to an instance using the console
  - Open the Amazon EC2 console.
  - In the navigation pane, choose Volumes.
  - Select the volume to attach and choose Actions, Attach volume.
  - For Instance, enter the ID of the instance or select the instance from the list of options.
  - For Device name, enter a supported device name for the volume. This device name is used by Amazon EC2. The block device driver for the instance might assign a different device name when mounting the volume. For more information, see Device names on Linux instances.
  - Choose Attach volume.
  - Connect to the instance and mount the volume.

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
