FROM nikolaik/python-nodejs:latest

# Update and upgrade system packages
RUN apt-get update && apt-get upgrade -y

# Install ffmpeg (required for your app)
RUN apt-get install ffmpeg -y

# Copy application files to /app directory
COPY . /app

# Set the working directory to /app
WORKDIR /app

# Set permissions for the app folder (adjust as needed)
RUN chmod 755 /app

# Upgrade pip and install dependencies from requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Command to run the Python application
CMD ["python3", "./main.py"]
