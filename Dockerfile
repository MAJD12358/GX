# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Define environment variables for language name and image URL
ENV LANGUAGE_NAME gx
ENV LANGUAGE_IMAGE_URL https://path/to/gx_image.png

# Define environment variables for colors
ENV PRIMARY_COLOR_GREEN "#00ff00"
ENV SECONDARY_COLOR_PURPLE "#800080"

# ... Add any additional configurations or dependencies here ...

# Command to run when the container starts
CMD ["python", "main.gx"]
