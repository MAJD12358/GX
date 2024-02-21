 # Stage 1: Build GX language from source
FROM ubuntu:latest as builder

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential git && \
    apt-get clean

# Set the working directory to /app
WORKDIR /app

# Clone the GX language repository
RUN git clone https://github.com/GX-Lang/GX.git .

# Fetch specific branch or commit (replace 'main' with your desired branch or commit)
ARG GX_BRANCH=main
RUN git fetch origin $GX_BRANCH && \
    git checkout $GX_BRANCH

# Build GX language
RUN make build

# Stage 2: Create final image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the GX language artifacts from the builder stage
COPY --from=builder /app /app

# Expose a port if needed
EXPOSE 8080

# Set environment variables
ENV GX_ENV=production

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y some-runtime-dependency && \
    apt-get clean

# Add runtime configurations
COPY config/runtime-config.yaml /app/config/runtime-config.yaml

# Create a non-root user for better security
RUN useradd -m -s /bin/bash gxuser
USER gxuser

# Command to run when the container starts
CMD ["./gx"]
