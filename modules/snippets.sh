#!/bin/bash

# This script validates code snippets in documentation pages

# Read configuration from rules.conf
validate_snippets_enabled=$(grep -i 'validate_snippets_enabled' ../config/rules.conf | awk -F'=' '{print $2}')
validate_snippets_languages=$(grep -i 'validate_snippets_languages' ../config/rules.conf | awk -F'=' '{print $2}')
validate_snippets_exclude_paths=$(grep -i 'validate_snippets_exclude_paths' ../config/rules.conf | awk -F'=' '{print $2}')

# Perform code snippet validation only if enabled
if [[ $validate_snippets_enabled == "true" ]]; then
    echo "Performing code snippet validation..."

    # Validate code snippets in all files except excluded paths
    find . -type f -name "*.md" ! -path "$validate_snippets_exclude_paths" -exec sh -c "grep -E '^\`\`\`($validate_snippets_languages)' {} || echo 'No code snippets found in {}'" \;

    echo "Code snippet validation completed."
else
    echo "Code snippet validation is disabled."
fi
