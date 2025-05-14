#!/bin/bash

# Ask user for password length
read -r -p "How long should the password be? (default: 40): " length
length=${length:-40} # Set default to 40 if empty

# Validate input is a positive number
while ! [[ "$length" =~ ^[0-9]+$ ]] || [ "$length" -le 0 ]; do
    read -r -p "Please enter a valid positive number: " length
done

# Define the possible characters for the password
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()~,.|-+=/"

while true; do
    # Generate the password
    password=""
    for ((i = 0; i < length; i++)); do
        password+=${chars:$((RANDOM % ${#chars})):1}
    done

    # Print the password and ask if it should be saved
    echo "Generated Password: $password"
    read -r -p "Do you want to save this password? (y/n): " response
    case $response in
    [Yy]*)
        # Ask if user wants to add a name/description
        read -r -p "Add a name/description for this password (leave empty for none): " name
        if [ -n "$name" ]; then
            echo "$name: $password" >>~/.passwords
        else
            echo "$password" >>~/.passwords
        fi
        echo "Password saved to ~/.passwords."
        ;;
    [Nn]*)
        exit 0
        ;;
    *)
        echo "Invalid input. Please enter 'y' or 'n'."
        ;;
    esac
done
