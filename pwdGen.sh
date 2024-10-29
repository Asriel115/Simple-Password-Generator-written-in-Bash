#!/bin/bash
# Define the length of the password
length=40

# Define the possible characters for the password
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"

while true; do
  # Generate the password
  password=""
  for ((i=0; i<length; i++)); do
    password+=${chars:$(( RANDOM % ${#chars} )):1}
  done

  # Print the password and ask if it should be saved
  echo "Generated Password: $password"
  read -r -p "Do you want to save this password? (y/n): " response
  case $response in
    [Yy]* ) 
      # Save the password to a file, for example, $HOME/.passwords
      echo "$password" >> ~/.passwords
      echo "Password saved to ~/.passwords."
      ;;
    [Nn]* )
      exit 0
      ;;
    * ) 
      echo "Invalid input. Please enter 'y' or 'n'."
      ;;
  esac
done
