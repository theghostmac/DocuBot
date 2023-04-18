#!/bin/bash

# This script formats documentation pages

# Read configuration from rules.conf
format_docs_enabled=$(grep -i 'format_docs_enabled' config/rules.conf | awk -F'=' '{print $2}')
format_docs_style=$(grep -i 'format_docs_style' config/rules.conf | awk -F'=' '{print $2}')
format_docs_exclude_paths=$(grep -i 'format_docs_exclude_paths' config/rules.conf | awk -F'=' '{print $2}')

# Perform documentation formatting only if enabled
if [[ $format_docs_enabled == "true" ]]; then
    echo "Performing documentation formatting..."

    # Format documentation pages using the specified style
    if [[ $format_docs_style == "markdown" ]]; then
        find . -type f -name "*.md" ! -path "$format_docs_exclude_paths" -exec markdownlint {} \;
    elif [[ $format_docs_style == "html" ]]; then
        # Add your custom logic for HTML documentation formatting
        echo "HTML documentation formatting is not implemented yet."
    else
        echo "Invalid documentation formatting style: $format_docs_style"
    fi

    echo "Documentation formatting completed."
else
    echo "Documentation formatting is disabled."
fi
