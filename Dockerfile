 # Stage 1: Build GCD+ language from source
FROM ubuntu:latest as builder

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential git && \
    apt-get clean

# Set the working directory to /app
WORKDIR /app

# Clone the GCD+ language repository
RUN git clone https://github.com/GCDPlusLang/GCDPlus.git .

# Fetch specific branch or commit (replace 'main' with your desired branch or commit)
ARG GCD_PLUS_BRANCH=main
RUN git fetch origin $GCD_PLUS_BRANCH && \
    git checkout $GCD_PLUS_BRANCH

# Build GCD+ language
RUN make build

# Stage 2: Create final image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the GCD+ language artifacts from the builder stage
COPY --from=builder /app /app

# Expose a port if needed
EXPOSE 8080

# Set environment variables
ENV GCD_PLUS_ENV=production

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y some-runtime-dependency && \
    apt-get clean

# Add runtime configurations
COPY config/runtime-config.yaml /app/config/runtime-config.yaml

# Create a non-root user for better security
RUN useradd -m -s /bin/bash gcdplususer
USER gcdplususer

# Replace instances of "GX" with "GCD+" in specific files
RUN find /app -type f -name "*.gx" -exec sed -i 's/GX/GCD+/g' {} +

# Command to run when the container starts
CMD ["./gcdplus"]
