#!/usr/bin
Colors()
{
        RED='\033[01;31m'
        GREEN='\033[0;32m'
        YELLOW='\033[1;33m'
        BLUE='\033[0;34m'         
        LBLUE='\033[1;34m' 
        NC='\033[0m' # No Color
        PROMPT='\e[0;38;5;118m'
}
Colors
Bold_Text_Colors()
{
    B_Black='\033[1;30m'
    B_Red='\033[1;31m'
    B_Green='\033[1;32m'
    B_Yellow='\033[1;33m'
    B_Blue='\033[1;34m'
    B_Magenta='\033[1;35m'
    B_Cyan='\033[1;36m'
    B_White='\033[1;37m' 
}
Bold_Text_Colors
Hide_cursor()
{
    hide='\033[?25l'
}
Hide_cursor
Background_Colors(){
    BG_Black='\033[0;40m'
    BG_Red='\033[0;41m'
    BG_Green='\033[0;42m'
    BG_Yellow='\033[0;43m'
    BG_Blue='\033[0;44m'
    BG_Magenta='\033[0;45m'
    BG_Cyan='\033[0;46m'
    BG_White='\033[0;47m' 
}
Background_Colors
Text_Color()
{
    Black=' \033[0;30m'
    Red='\033[0;31m'
    Green='\033[0;32m'
    Yellow='\033[0;33m'
    Blue='\033[0;34m'
    Magenta='\033[0;35m'
    Cyan='\033[0;36m'
    White='\033[0;37m'
}
# print over view
print_massge(){

                echo "Outline for a Basic Bash Database Engine:

                Define Data Structure:
                Decide on the structure of your database. For simplicity, let's consider a key-value pair database.
                
                File Storage:
                Use flat files for storage. Each line in the file could represent a record,
                and fields within a record can be separated by a delimiter.
                
                CRUD Operations:
                Implement basic CRUD (Create, Read, Update, Delete) operations:
                
                Create:
                Add a new record to the file.
                
                Read:
                Search for a record based on a key.
               
                Update:
                Modify an existing record.
                
                Delete:
                Remove a record.

                User Interface:
                Create a simple command-line interface for users to interact with the database engine.
                
                Indexing (Optional):
                Implement basic indexing for faster searching.
                
                Error Handling:
                Include proper error handling to manage potential issues."
}
# Function to get the terminal size
get_terminal_size()
{
  local cols=$(tput cols)
  local rows=$(tput lines)
  echo "$cols $rows"
}

# Function to print a message in the middle of the screen
print_centered_message()
{
  local message="$1"
  local size=($(get_terminal_size))
  local cols=${size[0]}
  local rows=${size[1]}

  # Calculate the position to center the message
  local col_position=$(( (cols - ${#message}) / 1 ))
  local row_position=$(( rows / 1 ))

  # Move the cursor to the center position and print the message
  echo -e "\033[${row_position};${col_position}H${message}"
}
Background_Colors