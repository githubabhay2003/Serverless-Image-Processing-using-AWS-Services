📸 Serverless Image Processing using AWS

This project implements an end-to-end **serverless image processing pipeline** that resizes images automatically on upload using AWS services. It uses **Amazon S3**, **AWS Lambda**, **IAM**, and **Amazon Cognito** with a simple HTML/JavaScript frontend to demonstrate the architecture.

---

## 🧩 Problem Statement

Users frequently need to **resize or compress images before uploading** to web services. Doing this client-side or manually is inefficient.

**Goal:** Create a **serverless image processing service** using AWS which:
- Accepts an image upload via a frontend
- Automatically resizes the image using AWS Lambda
- Stores the resized image in another S3 bucket
- Provides visual feedback on both original and resized images (with size info)

---

## 🏗️ Architecture Diagram

```text
+-------------+        +---------------------+         +----------------------+
|  Frontend   +------->+   S3 (Input Bucket) +-------->+     AWS Lambda       |
| (HTML + JS) |        |  image-upload-bucket|         | Resize/compress img |
+-------------+        +---------------------+         +----------------------+
                                      |                            |
                                      v                            v
                            +-------------------+        +----------------------+
                            | S3 (Output Bucket)|        | Amazon Cognito       |
                            |  image-resized    |        | Identity Pool for JS |
                            +-------------------+        +----------------------+
```text
## 🚀 AWS Services Used

* **Amazon S3:** Utilized for highly durable and scalable storage of both original and resized images.
* **AWS Lambda:** The core compute service, executing the image resizing logic without server management.
* **IAM (Identity and Access Management) Roles & Policies:** Ensures secure access control, granting Lambda the necessary permissions and allowing Cognito users limited S3 access.
* **Amazon Cognito (Identity Pools):** Enables secure, browser-based uploads to S3 by providing temporary, unauthenticated AWS credentials to the frontend.
* **AWS SDK (JavaScript):** Integrated into the frontend to facilitate seamless interaction with Amazon S3.


📂Folder Structure
serverless-image-processing-project/
├── lambda-pillow/
│   └── lambda_function.py
├── frontend/
│   └── index.html
├── docs/
│   └── README.md
    └── architecture-diagram

# 🛠️ Step-by-Step Process

For each of the following components, I have created separate detailed PDF documentation with full step-by-step instructions, screenshots, and code snippets:

* **S3 Buckets Setup**
    * Creating input and output buckets
    * Setting up bucket policies and event triggers
    * Configuring CORS rules
* **IAM Role for Lambda Setup**
    * Creating and attaching policies for S3 and Lambda access
* **AWS Lambda Function Setup**
    * Writing the image resizing logic using Node.js and Sharp
    * Linking with S3 event triggers
* **Lambda Invoke Permissions Setup**
    * Allowing the S3 bucket to trigger the Lambda function using CLI or console
* **AWS Cognito Identity Pool Setup**
    * Enabling unauthenticated identity access for frontend uploads
    * Attaching the correct policies
* **Frontend Setup**
    * Simple HTML and JavaScript page using AWS SDK
    * Image preview, original/resized size display, and post-processing feedback

Please refer to the accompanying PDF guides for each of these sections to walk through the setup in detail.

# ✅ Conclusion / Learnings

This project beautifully showcases the power of serverless architecture:

* **No servers to manage:** You don't need to provision, scale, or maintain any servers. AWS handles all the underlying infrastructure.
* **Auto-scaling:** The solution automatically scales to handle any load, from a few images to thousands, without manual intervention.
* **Cost-effective:** You only pay for the compute time and storage you actually consume, making it highly efficient.

Specifically, we've seen how:

* Using **AWS Lambda with S3 event triggers** makes image processing fast, efficient, and fully automated. When an image lands in your input bucket, the processing starts instantly.
* **Amazon Cognito** simplifies secure, temporary frontend access to AWS services like S3, allowing users to upload files directly without ever exposing your sensitive AWS credentials.

## You can extend this project to:

* **Add watermarking:** Integrate additional image manipulation (e.g., adding a company logo or text watermark) into your Lambda function.
* **Upload thumbnails to a CDN:** Generate different sizes of thumbnails and upload them to a Content Delivery Network (CDN) like Amazon CloudFront for faster global delivery.
* **Notify via SNS or email on completion:** Send notifications (e.g., to a user or administrator via SNS topic or email) once an image has been successfully processed and saved.

# 📁 License
This project is released under the **MIT License** – feel free to use freely and adapt as needed.
