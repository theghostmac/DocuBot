#!/bin/bash

# Commit new changes and files to GitHub

# Change to the DocuBot directory
cd /path/to/docubot

# Show all files to be committed to staging area
git status

# Add all changes and new files to Git
git add .

# Prompt for commit message
read -p "Enter commit message: " commit_message

# Commit changes with the entered commit message
git commit -m "$commit_message"

# Push changes to GitHub
git push origin master

echo "New changes and files committed to GitHub with commit message: '$commit_message'"
