#!/bin/bash

# Define the port for your API
PORT=30070

# Start the API
while true; do
    {
        echo -ne "HTTP/1.1 200 OK\r\n"
        echo -ne "Content-Length: 11\r\n"
        echo -ne "Content-Type: text/plain\r\n"
        echo -ne "\r\n"
        echo -ne "Hello, World"
    } | nc -l -p $PORT -q 1
done
