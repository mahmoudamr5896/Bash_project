#!/bin/bash
cd ./FINAL_PRO
AUTH_FILE="users.txt"
## ADD PHOTO 
. ./style.sh
# sudo apt-get install libcaca-utils
# # Check if img2txt is available
# if ! command -v img2txt &> /dev/null; then
#     echo "Error: img2txt not found. Please install libcaca-utils."
#     exit 1
# fi
# # Path to the image file
# image_path="image.jpeg"
# # Display the image using img2txt
# img2txt -W 80 -H 40 "$image_path"

# Function to add a new user to the authentication file
add_user() {
    read -p "Enter new username: " new_username
    read -s -p "Enter password: " new_password
    echo
    if [ -z "$new_username" ] || [ -z "$new_password" ]; then
        echo -e "${RED}Username and password cannot be empty. User not added."
    else
        echo "$new_username:$new_password" >> "$AUTH_FILE"
        echo -e "${GREEN}User '$new_username' added successfully."
        . ./users.sh
    fi
}
# Main script
clear
echo -e "${BG_White}"
print_centered_message "${BG_Magenta}HELLO  SIR  WE LOVE LINUX ${NC}"
echo -e "${BG_White} "
while true; do
    echo 
    echo 
    echo -e "${B_Black}1. Add User"
    echo -e "2. Log IN"
    echo -e "3. Exit"
    echo -e "${NC} "
    read -p "Hi SIR PLEASE CHOOSE WHAT DO YOU WANT : " choice
    case $choice in
        1)
            add_user
            ;;
        2)
           . ./users.sh
           ;;
        3)
            echo " GOOd BYe :)"
            return 1
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
