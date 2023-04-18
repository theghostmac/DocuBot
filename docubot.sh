#!/bin/bash

# DocuBot - Automated Documentation Improvement Tool

# Function to display script usage
usage() {
  echo "Usage: $0 [-i INPUT_DIR] [-o OUTPUT_DIR] [-c CONFIG_FILE] [-m COMMIT_MESSAGE]"
  echo "Options:"
  echo "  -i INPUT_DIR      Directory containing the documentation files (default: 'input')"
  echo "  -o OUTPUT_DIR     Directory to store the transformed documentation files (default: 'output')"
  echo "  -c CONFIG_FILE    Configuration file specifying the rules (default: 'config/rules.conf')"
  echo "  -m COMMIT_MESSAGE Commit message for Git commit (default: 'Automated commit by DocuBot')"
  exit 1
}

# Default values for options
input_dir="input"
output_dir="output"
config_file="config/rules.conf"
commit_message="Automated commit by DocuBot"

# Parse command line options
while getopts ":i:o:c:m:" opt; do
  case $opt in
    i)
      input_dir="$OPTARG"
      ;;
    o)
      output_dir="$OPTARG"
      ;;
    c)
      config_file="$OPTARG"
      ;;
    m)
      commit_message="$OPTARG"
      ;;
    *)
      usage
      ;;
  esac
done

# Validate input directory
if [ ! -d "$input_dir" ]; then
  echo "Error: Input directory '$input_dir' does not exist."
  exit 1
fi

# Validate output directory
if [ ! -d "$output_dir" ]; then
  echo "Creating output directory '$output_dir'"
  mkdir -p "$output_dir"
fi

# Process documentation files
echo "Processing documentation files in '$input_dir' using configuration file '$config_file'"
./modules/process_docs.sh "$input_dir" "$output_dir" "$config_file"

# Run spell check
echo "Running spell check..."
./modules/spell_check.sh "$output_dir" "$config_file" > "results/spellcheck_results.txt"

# Generate snippets
echo "Generating snippets..."
./modules/generate_snippets.sh "$output_dir" "$config_file" > "results/snippets_results.txt"

# Apply formatting changes
echo "Applying formatting changes..."
./modules/apply_formatting.sh "$output_dir" "$config_file" > "results/formatting_results.txt"

# Set permissions for .sh files
echo "Setting permissions for .sh files..."
find . -name "*.sh" -type f -exec chmod +x {} \;

# Commit changes to Git
echo "Committing changes to Git..."
git add .
git commit -m "$commit_message"
git push

echo "DocuBot processing complete!"
