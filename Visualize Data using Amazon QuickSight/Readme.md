# Visualize Data using Amazon QuickSight

## Step #1: Download the Dataset

- Navigate to [quicksight]() to download the "Amazon Bestseller Dataset" CSV file and the "manifest.json" file.
- Click on "raw" and Control+S to save both files onto your computer.


## Step #2: Store the Dataset in Amazon S3

- Open the Amazon S3 console and click "Create Bucket."
- Name the bucket (e.g., "amz-project") and keep the settings as default.
- Upload the CSV file and the "manifest.json" file into the bucket.
- Replace the URL in the "manifest.json" file with the S3 URL of your dataset.

## Step #3: Connect S3 Bucket with Amazon Quicksight

- Open the AWS management console and navigate to Amazon Quicksight.
- Sign up for a free trial of the Enterprise edition if you don't have an account.
- Select Amazon S3 and tick the box for the S3 bucket you created.
- Enter the link to your "manifest.json" file and connect to Quicksight.
- Select "interactive sheet" to start creating visualizations.


## Step #4: Create Visualizations
- Drag fields into the graph to create visualizations (e.g., Most popular brands).
- Sort, filter, and customize the graphs as desired.
- Experiment with different types of graphs like bar charts, pie charts, line graphs, etc.


## Result 
  


  


