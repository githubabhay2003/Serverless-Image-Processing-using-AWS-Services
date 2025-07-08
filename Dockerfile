# Dockerfile
FROM python:3.12-slim

RUN apt-get update && apt-get install -y zip

WORKDIR /package

# Install Pillow here (NOT in /app)
RUN pip install Pillow -t .

# Now copy your lambda handler
COPY lambda_function.py .

CMD ["bash"]
