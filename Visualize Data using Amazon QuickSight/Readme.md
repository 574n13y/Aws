# Visualize Data using Amazon QuickSight

## Step #1: Download the Dataset

- Navigate to [quicksight]() to download the "Amazon Bestseller Dataset" CSV file and the "manifest.json" file.
- Click on "raw" and Control+S to save both files onto your computer.


## Step #2: Store the Dataset in Amazon S3

- Open the Amazon S3 console and click "Create Bucket."  
- Name the bucket (e.g., "amz-project") and keep the settings as default.
  ![creating bucket](https://github.com/574n13y/Aws/assets/35293085/4e0ee434-907e-433e-b977-10ea6a00679a)

- Upload the CSV file and the "manifest.json" file into the bucket.
  ![bucket](https://github.com/574n13y/Aws/assets/35293085/33f73246-958d-484f-a3a0-a005e6768d95)

  
- Replace the URL in the "manifest.json" file with the S3 URL of your dataset.
  ![man](https://github.com/574n13y/Aws/assets/35293085/1bd8718f-d382-431e-a32d-529f2e5f6a58)

## Step #3: Connect S3 Bucket with Amazon Quicksight

- Open the AWS management console and navigate to Amazon Quicksight.
- Sign up for a free trial of the Enterprise edition if you don't have an account.
  ![signup of quicksight](https://github.com/574n13y/Aws/assets/35293085/e529355c-9b47-4cb4-a76c-485fcd7fd5e5)

- Select Amazon S3 and tick the box for the S3 bucket you created.
  ![s3bucket](https://github.com/574n13y/Aws/assets/35293085/4a481969-851a-458d-9fdb-a96e3f277159)

- Enter the link to your "manifest.json" file and connect to Quicksight.
  ![connect to bucket](https://github.com/574n13y/Aws/assets/35293085/03b70d4d-c5e6-4fd9-8d4e-6e0651244aa7)

- Select "interactive sheet" to start creating visualizations.
  ![creating visual](https://github.com/574n13y/Aws/assets/35293085/b11f5103-050d-4137-8810-e41f0ddf1184)
  ![previewqs](https://github.com/574n13y/Aws/assets/35293085/9f1ebcd0-41d2-479f-b9e2-c3ef624679a8)


## Step #4: Create Visualizations
- Drag fields into the graph to create visualizations (e.g., Most popular brands).
- Sort, filter, and customize the graphs as desired.
- Experiment with different types of graphs like bar charts, pie charts, line graphs, etc.
![quicksight1](https://github.com/574n13y/Aws/assets/35293085/29b55a0b-bf89-453e-8767-53ade6edf800)

![result1](https://github.com/574n13y/Aws/assets/35293085/e61d9b5d-386d-40fa-876a-e3733421a99c)

![result2](https://github.com/574n13y/Aws/assets/35293085/87bdc32f-ecb7-43ea-9f32-09e4e34b608c)

![Result](https://github.com/574n13y/Aws/assets/35293085/1cb7b97e-79a3-4cf1-8e97-7c94d103278c)


## Result 
![result preview](https://github.com/574n13y/Aws/assets/35293085/7c9dc1c3-3493-40aa-b865-a3919b4eaee7)

![out](https://github.com/574n13y/Aws/assets/35293085/30174425-88a2-45b8-9d50-e84edf10b6db)

![out11](https://github.com/574n13y/Aws/assets/35293085/86a967cf-0acd-4ab6-a902-b251ac4bedaf)

![out1](https://github.com/574n13y/Aws/assets/35293085/1c389151-6cd0-42ce-8725-ebbd4a31445e)

![out2](https://github.com/574n13y/Aws/assets/35293085/57c7b3a8-3791-47b3-a545-0765165b53df)


## Manage Account or Delete Account
![quicksight account manage](https://github.com/574n13y/Aws/assets/35293085/4a62035a-1251-44df-b628-d75d8fb7ac51)




  


