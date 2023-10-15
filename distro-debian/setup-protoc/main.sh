#!/bin/bash

# Protobuf version
PROTOBUF_VERSION="3.17.3"

# Install necessary packages
sudo apt update
sudo apt install -y autoconf automake libtool curl make g++ unzip

# Download source code
wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/protobuf-all-${PROTOBUF_VERSION}.tar.gz

# Extract files
tar -xvzf protobuf-all-${PROTOBUF_VERSION}.tar.gz

# Navigate to protobuf directory
cd protobuf-${PROTOBUF_VERSION}

# Prepare the build
./configure

# Build
make

# Optionally check the build
# make check

# Install
sudo make install

# Update shared library cache
sudo ldconfig

# Verify installation
protoc --version

# Go back to the home directory
cd ..

# Activate pyenv environment
# source $(pyenv root)/versions/your-environment-name/bin/activate

# Install Python packages
pip install --upgrade pip
pip install pika protobuf

# Clean up
rm -rf protobuf-${PROTOBUF_VERSION}/
rm protobuf-all-${PROTOBUF_VERSION}.tar.gz

echo "Setup completed"
