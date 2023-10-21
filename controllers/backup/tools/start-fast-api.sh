#!/bin/bash

# Fallback function
fallback() {
    echo "Fallback: $1"
}

# Function to set Python version or fallback to default
set_python_version() {
    local desired_version="$1"
    if ! pyenv local "$desired_version"; then
        fallback "Failed to set Python version to $desired_version. Using default Python."
    fi
}

# Function to create a virtual environment if it doesn't exist
create_virtual_environment() {
    if [ ! -d "env" ]; then
        python -m venv env
    fi
}

# Function to install dependencies from a specified file
install_dependencies() {
    local requirements_file="$1"
    if [ -f "$requirements_file" ]; then
        pip install -r "$requirements_file"
    else
        fallback "Error: '$requirements_file' not found. Please make sure the file exists."
        exit 1
    fi
}

# Function to set the host and port
set_host_and_port() {
    local desired_host="$1"
    local desired_port="$2"
    if [ -n "$desired_host" ] && [ -n "$desired_port" ]; then
        export FASTAPI_HOST="$desired_host"
        export FASTAPI_PORT="$desired_port"
    else
        fallback "Host or port not set. Using defaults: Host: 0.0.0.0, Port: 8000"
        export FASTAPI_HOST="0.0.0.0"
        export FASTAPI_PORT="8000"
    fi
}

# Function to start the FastAPI server
start_server() {
    uvicorn app.main:app --host "$FASTAPI_HOST" --port "$FASTAPI_PORT" --reload
}

# Main script execution
desired_python_version="3.10.9"
requirements_file="requirements.txt"
desired_host="0.0.0.0"
desired_port="8000"

set_python_version "$desired_python_version"
create_virtual_environment
source env/bin/activate
install_dependencies "$requirements_file"
set_host_and_port "$desired_host" "$desired_port"
start_server
deactivate
