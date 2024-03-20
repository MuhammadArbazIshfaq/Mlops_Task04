# # Use an official Python runtime as the base image
# FROM python:3.9-slim

# # Set the working directory in the container
# WORKDIR /Mlops

# # Copy the current directory contents into the container at /Mlops
# COPY . .

# # Install Flask
# RUN pip install --no-cache-dir Flask==2.0.2

# # Install gunicorn
# RUN pip install gunicorn

# # Expose the port your app runs on
# EXPOSE 5000

# # Define the command to run your app using Gunicorn
# CMD ["python", "main.py"]











# Use the official Python image as base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /Mlops

# Copy the local contents to the container
COPY . .

# Install other dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the port on which your Flask app will run
EXPOSE 5000

# Command to run your Flask application
CMD ["python", "main.py"]