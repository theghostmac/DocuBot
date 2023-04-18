#!/bin/bash

# Set executable permissions for all .sh files in DocuBot codebase

# Find all .sh files and set executable permissions
find . -type f -name "*.sh" -exec chmod +x {} +

echo "Executable permissions set for all .sh files in DocuBot."
