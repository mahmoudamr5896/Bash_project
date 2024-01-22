#!/usr/bin/bash
clear
. ./help.sh
list_tables $1
echo 
echo 
while true; do
    echo -ne "${PROMPT}Enter The Name Of The Table You Want To Update  It : ${NC}"
    if ! read nametable; then
        return
    fi
    if ! is_not_null $nametable; then
        echo 
        echo -e "${RED}Name Cannot Be Null!${NC}"
        continue
    fi
    if ! find_table $1 $nametable; then
        echo 
        echo -e "${RED}Table Doesnot Exist!${NC}"
        continue
    fi
    break
done

while true; do
        echo -ne "${PROMPT}Enter Row Number to Update: "
        if ! read row_number; then
            return
        fi

        if ! is_not_null $row_number; then
            echo 
            echo -e "${RED}ROW NUMBER Cannot Be Null!${NC}"
            continue
        fi

        num_rows=$(wc -l < "./Databases/$1/$nametable")

        if [ "$row_number" -ge  1 ] && [ "$row_number" -le "$num_rows" ]; then
            num_columns=$(awk -F ':' 'NR==1{print NF}' "./Databases/$1/$nametable")

            for ((i=1; i<=$num_columns-1; i++)); do
                read -p "Enter New Data for Column $i: " data
                awk -v row="$row_number" -v col="$i" -v data="$data" -v OFS=':' \
                '{if (NR == row) $col = data}1' "./Databases/$1/$nametable" \
                > temp_file && mv temp_file "./Databases/$1/$nametable" 
            done

            echo -e "${GREEN}Row $row_number Updated in Table '$nametable'."
            echo  "Press Enter To Continue ...."
            read
            break
        else
            echo -e "${RED}Error: Invalid Row Number."
        fi
    done
# if [ -f ./Databases/$1/$nametable ]; then
#     chmod u+x ./Databases/$1/$nametable
#     echo -ne "${PROMPT}Enter Row Number to Update: " 
#     if ! read row_number; then
#         return
#     fi
#     if ! is_not_null $row_number; then
#         echo 
#         echo -e "${RED}ROW NUMBER Cannot Be Null!${NC}"
#         continue
#     fi
#     num_rows=$(wc -l < "./Databases/$1/$nametable")
#     if [ "$row_number" -ge 1 ] && [ "$row_number" -le "$num_rows" ]; then
#         num_columns=$(awk -F ':' 'NR==1{print NF}' "./Databases/$1/$nametable")
#         for ((i=1; i<=$num_columns-1; i++)); do
#         read -p "Enter New Data for Column $i: " data
#         awk -v row="$row_number" -v col="$i" -v data="$data" -v OFS=':' \
#         '{if (NR == row) $col = data}1' "./Databases/$1/$nametable" \
#             > temp_file && mv temp_file "./Databases/$1/$nametable" 
#         done
#         echo -e "${GREEN} Row $row_number Updated in Table '$nametable'."

#         read 
#     else
#         echo -e "${RED}Error: Invalid Row Number."
#         return
#     fi
# else
#     echo "Error: Table '$nametable' Not Found."
# fi



















# #!usr/bin/bash
# . ./help.sh
# list_tables $1
# echo 
# echo 
# pwd
#     read -p "Enter Table Name: " nametable
#     if [ -f ./Databases/$1/$nametable ]; then
#         chmod u+x ./Databases/$1/$nametable
#         pwd
#         read -p "Enter Row Number to Update: " row_number
#         # Check if the row number is valid
#         num_rows=$(wc -l < "./Databases/$1/$nametable")
#         if [ "$row_number" -ge 1 ] && [ "$row_number" -le "$num_rows" ]; then
#             # Prompt the user to enter data for each column
#             read
#             num_columns=$(awk -F ':' 'NR==1{print NF}' "./Databases/$1/$nametable")
#             for ((i=1; i<=$num_columns; i++));
#              do
#                 read -p "Enter New Data for Column $i: " data
#         awk -v row="$row_number" -v col="$i" -v data="$data"  \
#         '{if (NR == row) $col = data}1' "./Databases/$1/$nametable" > temp_file && mv temp_file "./Databases/$1/$nametable"
#             done
#             echo "Row $row_number Updated in Table '$nametable'."
#             read 

#         else
#             echo "Error: Invalid Row Number."
#         fi
#     else
#         echo "Error: Table '$nametable' Not Found."
#     fi
	# if [ "$num_of_cols" = 0 ]; then
	# 	echo 
	# 	echo -e "${RED}Number Cannot Be Zero!${NC}"
	# 	continue
	# fi
	# if [[ "$num_of_cols" =~ ^[-][0-9]+$ ]]; then
	# 	echo 
	# 	echo -e "${RED}Number Cannot Be Negative!${NC}"
	# 	continue
	# fi