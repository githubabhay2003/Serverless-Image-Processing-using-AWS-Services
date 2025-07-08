# 📸 Serverless Image Processing using AWS

This project implements an end-to-end **serverless image processing pipeline** that automatically resizes images upon upload using various AWS services. It leverages **Amazon S3** for storage, **AWS Lambda** for compute, **IAM** for secure access control, and **Amazon Cognito** for secure frontend authentication, all tied together with a simple HTML/JavaScript frontend.

---

## 🧩 Problem Statement

In many web applications, users need to upload images. However, requiring users to resize or compress images client-side or performing these operations manually can be inefficient and lead to poor user experience.

**Our Goal:** To create a robust and efficient **serverless image processing service** on AWS that:
* Accepts image uploads securely via a web frontend.
* Automatically triggers an AWS Lambda function to resize the uploaded image.
* Stores the processed (resized) image in a separate S3 bucket.
* Provides real-time visual feedback, including previewing the original image and displaying the processed image with size information.

---
## 🏗️ Architecture Diagram

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


---
## 🚀 AWS Services Used

* **Amazon S3:** Utilized for highly durable and scalable storage of both original and resized images.
* **AWS Lambda:** The core compute service, executing the image resizing logic without server management.
* **IAM (Identity and Access Management) Roles & Policies:** Ensures secure access control, granting Lambda the necessary permissions and allowing Cognito users limited S3 access.
* **Amazon Cognito (Identity Pools):** Enables secure, browser-based uploads to S3 by providing temporary, unauthenticated AWS credentials to the frontend.
* **AWS SDK (JavaScript):** Integrated into the frontend to facilitate seamless interaction with Amazon S3.
---
📂Folder Structure
serverless-image-processing-project/
├── lambda-pillow/
│   └── lambda_function.py
├── frontend/
│   └── index.html
├── docs/
│   └── README.md
    └── architecture-diagram
---

## 🛠️ Step-by-Step Process

For a comprehensive setup, detailed PDF documentation with full step-by-step instructions, screenshots, and code snippets has been provided for each of the following components:

* **S3 Buckets Setup**
    * Creating input and output buckets
    * Setting up bucket policies and event triggers
    * Configuring Cross-Origin Resource Sharing (CORS) rules for web access
* **IAM Role for Lambda Setup**
    * Creating a dedicated IAM role
    * Attaching necessary policies for S3 read/write and CloudWatch logging for Lambda
* **AWS Lambda Function Setup**
    * Developing the image resizing logic (e.g., using Python with Pillow, or Node.js with Sharp)
    * Configuring the Lambda function to be triggered by S3 object creation events
* **Lambda Invoke Permissions Setup**
    * Ensuring the S3 bucket has explicit permission to invoke the Lambda function, typically auto-configured when setting triggers from the Lambda console, but good to know for CLI/troubleshooting.
* **AWS Cognito Identity Pool Setup**
    * Enabling unauthenticated identity access to provide temporary credentials for frontend uploads
    * Attaching an inline IAM policy to grant specific `s3:PutObject` permissions to the unauthenticated role
* **Frontend Setup**
    * Creating a simple HTML and JavaScript page using the AWS SDK
    * Implementing features for image preview, display of original and resized image sizes, and dynamic post-processing feedback.

Please refer to the accompanying PDF guides for each of these sections to walk through the setup in detail.

---

## ✅ Conclusion / Learnings

This project beautifully showcases the transformative power of **serverless architecture**:

* **No Servers to Manage:** Developers can focus purely on application logic, as AWS handles all server provisioning, patching, and maintenance.
* **Auto-Scaling:** The solution effortlessly scales up or down to handle fluctuating workloads, from a few daily uploads to thousands per second, without any manual intervention.
* **Cost-Effective:** You only pay for the actual compute time and storage consumed, leading to highly optimized operational costs.

Specifically, we've demonstrated how:

* **AWS Lambda** integrated with **S3 event triggers** creates an incredibly fast, efficient, and fully automated image processing pipeline. Images are processed as soon as they are uploaded.
* **Amazon Cognito Identity Pools** simplify the process of granting secure, temporary credentials to frontend applications, allowing direct and safe interaction with AWS services like S3 without exposing long-lived AWS credentials.

## 🚀 Potential Extensions:

This serverless pipeline can be easily extended for more advanced use cases:

* **Add Watermarking:** Integrate additional image manipulation features, such as adding dynamic text or logo watermarks, within the Lambda function.
* **Generate Thumbnails for CDN:** Create multiple resized versions (e.g., small, medium, large thumbnails) and upload them to a Content Delivery Network (CDN) like Amazon CloudFront for optimized global content delivery.
* **Notifications on Completion:** Implement event-driven notifications (e.g., via Amazon SNS or SES) to alert users or administrators upon successful image processing, or to trigger further downstream workflows.

---

## 📁 License

This project is released under the **MIT License** – feel free to use, modify, and adapt it as needed.
