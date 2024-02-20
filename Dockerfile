# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Set up GitHub token
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN $GITHUB_TOKEN

# Clone the GX repository from GitHub using token
RUN git clone https://$GITHUB_TOKEN@github.com/MAJD12358/GX .

# ...

# Define build-time arguments for colors and version
ARG PRIMARY_COLOR_GREEN="#00ff00"
ARG SECONDARY_COLOR_PURPLE="#800080"
ARG GX_VERSION="1.0.0"

# Define environment variables for language name, image URL, colors, and version
ENV LANGUAGE_NAME gx
ENV LANGUAGE_IMAGE_URL png.png
ENV PRIMARY_COLOR $PRIMARY_COLOR_GREEN
ENV SECONDARY_COLOR $SECONDARY_COLOR_PURPLE
ENV GX_VERSION $GX_VERSION

# ... Add any additional configurations or dependencies here ...

# Command to run when the container starts
CMD ["gx"]
