# Use GCD+ as a base image
FROM gcdplus:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy the logo.png file to /app
COPY logo.png /app/logo.png

# Copy gx-config.ini to /app/config
COPY gx-config.ini /app/config/gx-config.ini

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

# Install additional dependencies if needed
RUN apt-get update && apt-get install -y \
    some-dependency \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable for timezone
ENV TZ=UTC

# Expose the port if needed
EXPOSE 8080

# Health check
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# Set labels for metadata
LABEL maintainer="Your Name <your.email@example.com>"
LABEL version="1.0"
LABEL description="My advanced GX language application"

# ... Add any other advanced configurations or dependencies here ...

# USER directive to set a non-root user if needed
# USER appuser

# ... Add any other advanced configurations or optimizations ...

# Command to run when the container starts
CMD ["gcdplus", "main.gx"]
