#!/bin/bash

# GitHub repository URL (replace with your repository's URL)
GITHUB_URL="https://github.com/Asriel115/Simple-Password-Generator-written-in-Bash/blob/main/pwdGen.sh"
TARGET_DIR="/usr/local/bin"
TARGET_PATH="$TARGET_DIR/pwdGen.sh"

# Download the script from GitHub
echo "Downloading the latest version of the script from GitHub..."
if curl -o "$TARGET_PATH" -L "$GITHUB_URL"; then
    # Make the script executable
    sudo chmod +x "$TARGET_PATH"
    echo "Installation complete! You can now run the script using the command: myscript"
else
    echo "Installation failed for some reason....."
    exit 1
fi
