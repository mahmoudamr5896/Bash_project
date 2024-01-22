#{{{{{{{{{{{{{{{{{{{{{{{{ Function Cheek }}}}}}}}}}}}}}}}}}}}}}}}
function is_not_null
{
	return $(test -n "$1")
}
#check if entered value $2 match refrence value $1 //1->success , 0->not matched
function Cheek_Data_type {
	case "$1" in
		int )
			if [[ "$2" =~ ^[0-9]+$ ]]; then
			return 0
			else
			return 1
			fi
			;;
		str )
			if [[ "$2" =~ ^[A-Za-z" "]+$ ]]; then
				return 0
			else
			    return 1
			fi
			;;
		alnum )
			if [[ "$2" =~ ^[A-Za-z0-9" "]+$ ]]; then
				return 0
			else 
			    return 1
			fi
			;;
		* )
			return 1
			;;
	esac
}
#search for database
function find_database {
	return $(test -d "./Databases/$1")
}
#search for tables FIRST Argument  $1-> db,SEcond ARGUMENT $2->tablename
function find_table
{
	return $(test -f "./Databases/$1/$2")
}
#listing all databases IN DataBases Folder
function list_databases
{
	echo -e "${B_Cyan}Here Is A List Of Your Databases${NC}"
	echo -e "${YELLOW}********************************${NC}"
	echo -e "${B_Blue}"
	ls -1 "./Databases"
	echo  -e "${NC}"
	echo -e "${YELLOW}********************************${NC}"
}
#listing all tables in databse passed as first argument
function list_tables {
	echo -e "${B_Cyan}Here Is A List Of Your Tables In ${B_White}$1${NC}${B_Cyan} Database${NC}"
	echo -e "${YELLOW}********************************${NC}"
	echo -e "${B_Blue}"
 	# -v option to invert the matching pattern
	ls -1 "./Databases/$1" | grep -v "_Meta"
	echo
	echo -e "${NC}"
	echo -e "${YELLOW}********************************${NC}"
}
# loading Meta file of a table
function Load_Metadata {
	tblname=$2
	names=()
	types=()
	temp1=($(cut -d: -f1 ./Databases/$1/${tblname}_Meta))
	temp2=($(cut -d: -f2 ./Databases/$1/${tblname}_Meta))
	#name of the primary key column
	pkName=${temp2[0]}
	#populating names array
	for i in "${temp1[@]:1}";
	do
		names+=("$i")
	done
	#populating types array
	for j in "${temp2[@]:1}";
	do
		types+=("$j")
	done
	#getting number of columns in table
	numColumns=$(wc -l "./Databases/$1/${tblname}_Meta" | cut -f1 -d" ")
}

