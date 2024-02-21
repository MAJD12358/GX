 # Use GCD+ as a base image
FROM gcdplus:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy configuration file
COPY config.gxc /app/config.gxc

# Define build-time arguments for version
ARG GX_VERSION="1.0.0"

# Define environment variables for language name, image URL, version, and configuration
ENV LANGUAGE_NAME gx
ENV LANGUAGE_IMAGE_URL https://path/to/gx_image.png
ENV GX_VERSION $GX_VERSION

# Load configurations from config.gxc
CMD ["gcdplus", "main.gx", "--config", "config.gxc"]
