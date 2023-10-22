# Host a Static website on AWS

## Step #1: Design Your Website

- Design your own personal website or download an existing template.
- In my case I have used my github portfolio.

## Step #2: Purchase a Custom Domain through Amazon Route 53

- Open the Amazon Route 53 console.
- Choose "Domain registration" and then "Register domain."
  ![domian](https://github.com/574n13y/Aws/assets/35293085/f18ae817-92cf-4bfd-9aea-1e597ff64d89)

- Follow the prompts to purchase your custom domain.
- In the "Route 53 hosted zones," create a new record set.
  ![create records](https://github.com/574n13y/Aws/assets/35293085/999db25d-8c4a-4ff9-882c-fd4f196895c5)

- Enter your S3 bucket's endpoint as the alias target.
  ![apply records](https://github.com/574n13y/Aws/assets/35293085/8e4905c2-889b-4524-b2ff-57f218ddfa84)

## Step #3: Set Up Amazon S3 Bucket

- Go to the AWS Management Console and open the Amazon S3 console.
- Click "Create bucket" and enter a unique name for your bucket.
  ![create bucket](https://github.com/574n13y/Aws/assets/35293085/3bee4d39-2151-4891-9433-b6f9b3a8cc38)
  
- In the "Properties" section, enable "Static website hosting."
  ![bucket static web setting](https://github.com/574n13y/Aws/assets/35293085/a3c38a42-d4a3-42b7-8f89-fa0c2b4f4287)

- Upload your website files to the bucket.
  ![upload files](https://github.com/574n13y/Aws/assets/35293085/efbd3a95-cf65-4694-a128-c733e33bcee1)

- Set the bucket permissions to allow public access.
  ![bucket policy](https://github.com/574n13y/Aws/assets/35293085/4ac0e414-74b9-4d3f-b934-7e4ad0d01311)
  ![index file](https://github.com/574n13y/Aws/assets/35293085/8a5d119e-f9f6-4a68-bb0a-909dbe59fbc4)
  ![open file from bucket link](https://github.com/574n13y/Aws/assets/35293085/e241e888-b9b2-40dd-b460-0728119cf20b)


  


