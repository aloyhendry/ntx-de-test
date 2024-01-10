# Menggunakan Python 3.11.4 sebagai base image
FROM python:3.11.4

# Set working directory
WORKDIR /etl

# Copy requirements
COPY requirements.txt .  

# Install dependencies
RUN pip install -r requirements.txt  

# Define default command to run client
CMD ["python", "etl.py"]