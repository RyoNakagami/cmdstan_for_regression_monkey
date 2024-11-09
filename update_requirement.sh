#!/bin/bash

# Check if poetry is installed
if ! command -v poetry &> /dev/null
then
    echo "Poetry could not be found. Please install it first."
    exit 1
fi

# Export requirements
poetry export --without-hashes --format=requirements.txt --output requirements.txt --with quarto_env

# Check if the export was successful
if [ $? -eq 0 ]; then
    echo "Requirements exported successfully to requirements.txt"
else
    echo "Failed to export requirements"
    exit 1
fi