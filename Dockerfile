# Stage 1: Build GX language
FROM gx-runtime:latest as builder

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Build GX language
RUN gx build

# Stage 2: Create final image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the GX language artifacts from the builder stage
COPY --from=builder /app /app

# Command to run when the container starts
CMD ["gx"]
