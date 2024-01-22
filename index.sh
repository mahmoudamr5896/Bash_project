#!/usr/bin/bash
clear
#calling helper functions
. ./help.sh 
. ./style.sh 
#loading colors file
## Create Data Base 
create_db(){
            clear
            echo
            list_databases
            echo
            echo -e "${GREEN}Creating Database${NC}"
            while [[ true ]]; do
                echo -ne "${PROMPT}Enter The Name Of The Database : ${NC}"
                if ! read db_name; then
                    return   
                fi
                if [[ "$db_name" = *" "* ]]; then
                    echo 
                    echo -e "${RED}Spaces Are Not Allowed!${NC}"
                    continue
                fi
                if [[ $db_name == *['!'@#\$%^\&*()-+\.\/]* ]]; then
                    echo 
                    echo -e "${RED} ! @ # $ % ^ () + . -  are not allowed!${NC}"
                    continue
                fi
                if ! is_not_null $db_name; then
                    echo
                    echo -e "${RED}Name Cannot Be Null${NC}"
                    continue
                fi
                if find_database $db_name; then
                    echo
                    echo -e "${RED}Database already exists, Please Enter Another Name!${NC}"
                    continue	
                else
                    mkdir "./Databases/$db_name"
                    echo
                    echo -e "${GREEN} $db_name Database Created Successfully${NC}"
                    return	
                fi
            done  
}
##  Use Data Base 
Connect_Database(){
            clear
            echo
            list_databases
            echo
            echo -e "${GREEN}Using Database"
            while [[ true ]];
            do
                echo -ne "${PROMPT} Enter The Name Of The Database : ${NC}"
                read db_name
                #cheek 1 check if empty string entered
                if ! is_not_null $db_name; then
                    echo
                    echo -e "${RED}Name Cannot Be Null!${NC}"
                    return
                fi
                #cheek 2 check if database doesnot exist
                if ! find_database $db_name; then
                    echo
                    echo -e "${RED}$db_name Does not Exist!${NC}"
                    return
                fi
                break
            done

            while [[ true ]]; do
                clear
                echo
                echo -e "${YELLOW}*********************************"
                echo -e "* You're Now In ${LBLUE}$db_name${YELLOW} Database"
                echo -e "*********************************${NC}"
                echo
                echo -e "${B_Blue}${Blue}1.Show Table"
                echo "2.Create Table"
                echo "3.Delete Table"
                echo "4.Insert into Table"
                echo "5.Updte Table"
                echo "6.Select From table"
                echo -ne "7.Back to main menu${NC}"
                echo
                echo
                echo -ne "${PROMPT}Enter your choice : ${NC}"
                read
                case $REPLY in
                    1 )
                        . ./show_table.sh $db_name;;
                    2 )
                        . ./create_table.sh $db_name;;
                    3 )
                        . ./delete_table.sh $db_name;;
                    4 )
                        . ./insert_data.sh $db_name;;
                    5 )
                        . ./update_data.sh $db_name;;
                    6 )
                        . ./select_from_table.sh $db_name $table_name;;
                    7 )
                        . ./index.sh;;
                    * )
                        echo -e "${RED}Please Choose A Valid Option${NC}";;
                esac
            done

}
## Delete Data Base 
Delete_Database(){
        clear
        echo
        list_databases
        echo
        echo -e "${RED}Deleting Database${NC}"
        echo -ne "${PROMPT}Enter The Name Of The Database : ${NC}"
        read db_name
        if ! is_not_null $db_name ; then
            echo
            echo -e "${RED}Name Cannot Be Null${NC}"
            return
        fi
        if find_database $db_name; then
            rm -r "./Databases/$db_name"
            echo
            echo -e "${GREEN}You Deleted $db_name Database ${NC}"
        else
            echo
            echo -e "${RED}Database ${LBLUE}$db_name${RED} Not Found${NC}"
        fi

}

Display_databases() {
    databases=$(ls -1 "./Databases")  # List database directories

    if [ -z "$databases" ]; then  # Check if any databases exist
        echo "No databases found."
    else
        echo "Here is a list of your databases:"
        echo "-------------------------"
        for db in $databases; do
            echo "* $db"
        done
        echo "-------------------------"
    fi
}
entered_username=`echo $entered_username | tr "a-z" "A-Z"` 
while [[ true ]]; do
	echo
	print_centered_message "${BG_Green}${B_Black}Welcome ${entered_username} to Bash DataBase Engine!"
	echo "******************************************************************************************************************"
	echo
	echo "Database Engine  Written in Bash"
	echo "This Engine Support Basic CRUD Operations"
    echo 
    echo 
    echo 
    print_massge
	echo
	echo
	echo "*********************************"
    echo
	echo -e "${LBLUE}Engineer : Mahmoud Amr Hassan${YELLOW}                                      "
	echo -e "${LBLUE}Engineer : Mohmmed Husni Elbasti${YELLOW}                                   "
	echo 
	echo "********************************"
	echo -e "${NC}"
    echo
    echo
	echo -e "${B_Blue}${Blue}1.Create Database "
	echo "2.Connected Database "
	echo "3.Delete a Database "
	echo "4.Display a Database "
	echo -ne "5.Exit ${NC}"
    echo
    echo
    list_databases
	echo 
    echo
	echo -ne "${PROMPT}Enter your choice : ${NC}"
	read choice
	case $choice in 
		1 )
			create_db
            ;;
		2 )
			Connect_Database
            ;;
		3 )
			Delete_Database
            ;;
		4 )
           list_databases 
           ;;
		5 )
			echo "Thanks for Your Interested "
			exit
            ;;
		* )
		echo -e "${RED}Please Enter A Valid Choice!!${NC}";;
	esac
done

# Reset Text Attributes:
# Reset: \033[0m