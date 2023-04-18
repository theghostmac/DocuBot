#!/bin/bash

# This script performs spell checking on documentation pages

# Read configuration from rules.conf
spell_check_enabled=$(grep -i 'spell_check_enabled' ../config/rules.conf | awk -F'=' '{print $2}')
spell_check_language=$(grep -i 'spell_check_language' ../config/rules.conf | awk -F'=' '{print $2}')
spell_check_exclude_paths=$(grep -i 'spell_check_exclude_paths' ../config/rules.conf | awk -F'=' '{print $2}')

# Perform spell checking only if enabled
if [[ $spell_check_enabled == "true" ]]; then
    echo "Performing spell checking..."

    # Perform spell checking on all files except excluded paths
    find . -type f -name "*.md" ! -path "$spell_check_exclude_paths" -exec aspell -l $spell_check_language -c {} +

    echo "Spell checking completed."
else
    echo "Spell checking is disabled."
fi
