#!/bin/bash
clear
echo 
list_tables $1
echo 
echo -e "${GREEN}You Are In DataBases ${LBLUE}$1${GREEN} database${NC}"
echo
while true; do
    echo -ne "${PROMPT}Enter The Name Of The Table You Want To Select From It : ${NC}"
    #back 
    if ! read table_name; then
        return
    fi
    #check for empty string
    if ! is_not_null $table_name; then
        echo 
        echo -e "${RED}Name Cannot Be Null!${NC}"
        continue
    fi

    #check for existing table name
    if ! find_table $1 $table_name; then
        echo 
        echo -e "${RED}Table Doesnot Exist!${NC}"
        continue
    fi

    break
done

echo
echo -e "${PROMPT}Select (1) to view all columns or (2) to select specific columns: ${NC}"
echo    "1) Select *"
echo    "2) Select Column "
read choice

case $choice in
    1)
       awk -v var=$table_name 'BEGIN {FS=":"; print "\t\tTable Name: " var "\n"} {if(NR>1) printf $1"<"$2">\t\t"} END{printf "\n"}' "./Databases/$1/${table_name}_Meta"
        echo "--------------------------------------------------------------"
        # awk 'BEGIN {FS=":"; print "\t\tTable Name: " var "\n"} {if(NR>1) printf $1"<"$2">\t\t"} END{printf "\n"}' "./Databases/$1/${table_name}_Meta"
        awk 'BEGIN{FS=":";OFS="\t | \t";ORS="\n";}{ $1=$1; print substr($0, 1, length($0)-1) }' "./Databases/$1/$table_name"
        ;;
    2)
        echo -e "${PROMPT}Enter the column numbers separated by commas (e.g., 1,2,3): ${NC}"
        read columns
        awk -v var=$table_name -v cols=$columns 'BEGIN {
            FS=":"
            split(cols, arr, ",")
            print "\t\tTable Name: " var "\n"
        }
        {
            if(NR>1) {
                for(i=1; i<=length(arr); i++) {
                    printf $arr[i]"<"
                }
                printf "\t\t"
            }
        }
        END { printf "\n" }' "./Databases/$1/${table_name}_Meta"
        awk -v cols=$columns 'BEGIN{FS=":";OFS="\t | \t";ORS="\n";}{
            split(cols, arr, ",")
            for(i=1; i<=length(arr); i++) {
                printf $arr[i]"\t\t\t"
            }
            printf "\n"
        }' "./Databases/$1/$table_name"
        ;;
    *)
        echo -e "${RED}Invalid choice!${NC}"
        ;;
esac

echo
echo "Press Enter to return!"
read
return






























# clear
# echo
# list_tables $1
# echo
# echo -e "${GREEN}You Are In DataBases ${LBLUE}$1${GREEN} database${NC}"
# echo
# while [[ true ]];
# do
#    echo -ne "${PROMPT}Enter The Name Of The Table You Want To Select From It : ${NC}"
# 	#back 
# 	if ! read table_name; then
# 		return
# 	fi
# 	#check for empty string
# 	if ! is_not_null $table_name; then
# 		echo 
# 		echo -e "${RED}Name Cannot Be Null!${NC}"
# 		continue
# 	fi

# 	#check for existing table name
# 	if ! find_table $1 $table_name; then
# 		echo 
# 		echo -e "${RED}Table Doesnot Exist!${NC}"
# 		continue
# 	fi


# 	break
# done

# awk -v var=$table_name 'BEGIN {FS=":"; print "\t\tTable Name: " var "\n"} {if(NR>1) printf $1"<"$2">\t\t"} END{printf "\n"}' "./Databases/$1/${table_name}_Meta"
# awk 'BEGIN{FS=":";OFS="\t\t\t";ORS="\n";}{  $1=$1; print substr($0, 1, length($0)-1) }' "./Databases/$1/$table_name"

# echo
# echo
# echo "press Enter to return!"
# read
# return