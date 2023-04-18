#!/bin/bash

# Create modules directory
mkdir modules
cd modules

# Create sample module files
touch spellcheck.sh
touch snippets.sh
touch formatting.sh

# Go back to DocuBot directory
cd ..

# Create config directory
mkdir config
cd config

# Create sample configuration file
touch rules.conf

# Go back to DocuBot directory
cd ..

# Create tests directory
mkdir tests
cd tests

# Create sample subdirectories for unit and integration tests
mkdir unit
mkdir integration

# Go back to DocuBot directory
cd ..

# Create results directory with result files
mkdir -p results

cd results
touch spellcheck_results.txt ; touch snippets_results.txt ; touch formatting_results.txt

# Create docs directory
mkdir docs



# Create CONTRIBUTING.md file
echo "# Contributing Guidelines" > CONTRIBUTING.md

# Create LICENSE file
echo "Your license text here" > LICENSE

# Print completion message
echo "DocuBot folder structure and files created successfully!"
