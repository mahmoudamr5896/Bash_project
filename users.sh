#!/bin/bash
AUTH_FILE="users.txt"
. ./style.sh
# Function to validate username and password against an authentication file
validate_credentials() {

    echo -e "${BG_Green}"
    read -p "Enter username: " entered_username
    read -s -p "Enter password: " entered_password
    echo -ne "${NC}"
    echo
    # Check if entered credentials match any line in the authentication file
    if grep -q "^$entered_username:$entered_password$" "$AUTH_FILE"; then
        echo -e"${GREEN}Login successful!"
        return 0  # Success
    else
        echo -e "${RED}Invalid username or password. Access denied.${NC}"
        sleep 5
        exit     # Failure
    fi
}
# Main script
if validate_credentials; then
    echo -e "${GREEN}Welcome to the Bash Project!"
    echo "Opening the project...${NC}"
    source ./index.sh
    # Add your project commands or call another script here
else
    echo "Exiting..."
fi
