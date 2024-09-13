#!/bin/bash

# Variables
README="README.md"
FOLDERS=($(ls -d */)) # Get all folders
TEMP_README="README_temp.md"
EXISTING_TOPICS_SECTION=false
NEW_TOPICS_SECTION=false

# Create a temporary README to store the updated content
cp $README $TEMP_README

# Loop through each folder to check if they already exist in the README
for folder in "${FOLDERS[@]}"
do
    # Remove trailing slash from folder name
    folder_name="${folder%/}"

    # Check if the folder contains a README.md and is not already in the main README.md
    if [ -f "$folder/README.md" ] && ! grep -q "\[$folder_name\]" $README; then
        # If new topic section hasn't been added, add a comment for new topics
        if [ "$NEW_TOPICS_SECTION" = false ]; then
            echo "" >> $TEMP_README
            echo "### Newly Added Topics" >> $TEMP_README
            NEW_TOPICS_SECTION=true
        fi
        # Append the folder link to the temporary README
        echo "### [$folder_name]($folder_name/README.md)" >> $TEMP_README
    fi
done

# Overwrite the original README with the updated content
mv $TEMP_README $README

echo "Main README.md updated with new folders (if any)."
