# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Define environment variables for language name and image URL
ENV LANGUAGE_NAME gx
ENV LANGUAGE_IMAGE_URL logo.png

# Define environment variables for colors
ENV PRIMARY_COLOR_GREEN "#00ff00"
ENV SECONDARY_COLOR_PURPLE "#800080"

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    some-package \
    another-package

# Set up any necessary configurations or environment variables
ENV TZ=UTC
ENV DEBUG_MODE true

# ... Add any other advanced configurations or improvements ...

# Command to run when the container starts
CMD ["gx", "main.gx"]
