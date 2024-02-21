# Use an official Gx runtime as a base image
FROM gx-runtime:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy GX language definitions
COPY gx_definition.gx /app/gx_definition.gx

# Copy main GX code
COPY main.gx /app/main.gx

# ... Add any additional configurations or dependencies here ...
RUN apt-get install -y gx

# Command to run when the container starts
CMD ["gx"]
