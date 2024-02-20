# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Define build-time arguments for colors
ARG PRIMARY_COLOR_GREEN="#00ff00"
ARG SECONDARY_COLOR_PURPLE="#800080"

# Define environment variables for language name and image URL
ENV LANGUAGE_NAME gx
ENV LANGUAGE_IMAGE_URL logo.png

# Define environment variables for colors
ENV PRIMARY_COLOR $PRIMARY_COLOR_GREEN
ENV SECONDARY_COLOR $SECONDARY_COLOR_PURPLE

# ... Add any additional configurations or dependencies here ...

# Command to run when the container starts
CMD ["gx", "main.gx"]
