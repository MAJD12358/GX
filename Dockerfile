# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Define build-time arguments for colors and version
ARG PRIMARY_COLOR_GREEN="#00ff00"
ARG SECONDARY_COLOR_PURPLE="#800080"
ARG GX_VERSION="1.0.0"

# Define environment variables for language name, image URL, colors, and version
ENV LANGUAGE_NAME gx
ENV LANGUAGE_IMAGE_URL https://path/to/gx_image.png
ENV PRIMARY_COLOR $PRIMARY_COLOR_GREEN
ENV SECONDARY_COLOR $SECONDARY_COLOR_PURPLE
ENV GX_VERSION $GX_VERSION

# ... Add any additional configurations or dependencies here ...

# Command to run when the container starts
CMD ["gx"]
