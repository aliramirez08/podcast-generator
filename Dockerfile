FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy feed.py and feed.yaml into the container
COPY feed.py feed.yaml ./

# Ensure feed.py is executable
RUN chmod +x feed.py
