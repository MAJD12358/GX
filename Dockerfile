 # Stage 1: Build GX language
FROM gx-runtime:latest as builder

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install build dependencies (if needed)
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get clean

# Install additional dependencies for GX build
RUN apt-get install -y some-dependency && \
    apt-get clean

# Build GX language with specific configuration
RUN gx build --config=config/gx-config.yaml

# Stage 2: Create final image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the GX language artifacts from the builder stage
COPY --from=builder /app /app

# Expose a port if needed
EXPOSE 8080

# Set environment variables
ENV GX_ENV=production

# Add additional configurations or dependencies
RUN apt-get update && \
    apt-get install -y some-runtime-dependency && \
    apt-get clean

# Set up additional runtime configurations
COPY config/runtime-config.yaml /app/config/runtime-config.yaml

# Command to run when the container starts
CMD ["gx"]
