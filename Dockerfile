# Use an official Alpine Linux as a base image
FROM alpine:latest

# Set environment variables for epubcheck version
ENV EPUBCHECK_VERSION="5.1.0"
ENV EPUBCHECK_URL="https://github.com/w3c/epubcheck/releases/download/v${EPUBCHECK_VERSION}/epubcheck-${EPUBCHECK_VERSION}.zip"

# Set the working directory in the container
WORKDIR /usr/src/app

# Install required packages
RUN apk add --no-cache curl openjdk11-jre unzip

# Download and extract the latest epubcheck
RUN curl -L -o epubcheck.zip $EPUBCHECK_URL \
    && unzip epubcheck.zip -d epubcheck \
    && rm epubcheck.zip

# Copy the local script to the container's workspace
COPY entrypoint.sh /usr/src/app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Define the script to run when the container starts
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]