# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Define environment variable for language name
ENV LANGUAGE_NAME Gx

# Define environment variable for language image URL
ENV LANGUAGE_IMAGE_URL logo.png

# ... Add any additional configurations or dependencies here ...

# Command to run when the container starts
CMD ["gx", "main.gx"]
