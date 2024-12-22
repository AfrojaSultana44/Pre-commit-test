#!/bin/bash

# Read the commit message
commit_message=$(cat "$1")

# Define the required format regex
regex="^FEAT: .{1,}"

# Check if the commit message matches the regex
if [[ ! "$commit_message" =~ $regex ]]; then
    echo "ERROR: Commit message must follow the format: 'FEAT: Your commit message.'"
    echo "Example: FEAT: Implement user login functionality"
    exit 1
fi