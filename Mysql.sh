#!/usr/bin/bash
databasename="Test"
if [[ -d DataBases ]]
then
printf "Data Base init : I Create Data Base Folder \n\n"
else
mkdir DataBases
printf "Data Base init : I Create Data Base Folder \n\n"
fi

DisplayDatabases () {
			cd ./DataBases #Go to DataBases Folder
			#list database directories ans ask for select one
			arr_databases=($(ls)) #use the syntax ${#arr[@]} to calculate its length.
			if [[ ${#arr_databases[@]} > 0 ]]; then
				ls #Display Folders in DataBases Folder
                        else
				printf "\n Databes is an empty ==> No DataBase \n"
			fi
			cd .. #Back to Project Folder 
}


while true
do	
PS3='Enter Number of Command: '
select  choise in "Create Database" "List DataBase" "Connect DataBashe" "Drop DataBase" Quit
do
    case $choise in
        "Create Database")
			printf "\n Enter Name of DataBase : "
			read databasename
			if ! [[ $databasename =~ ^[a-zA-Z]+$ ]]; then
			  	echo "$databasename is not string value,please tray again!!"
			else			
				cd ./DataBases #Go to DataBases Folder
				#str > check exist
				if [[ -d $databasename ]]; then
					echo "$databasename data base already exsit,please try again"
				else
					mkdir $databasename
					printf "\n$databasename has been created\n"			
				fi
				cd ..	
			fi
			break
           		;;
        "List DataBase")
			printf "\n Your DataBases  : \n"
			DisplayDatabases			
			break
           		;;
	"Connect DataBashe")
                        echo "\n Choose Name of DataBase  To Connect: "
			DisplayDatabases
			read databasename
			. ./database.sh
			cd .. #Back to Project Folder  
			break ;;
	 "Drop DataBase")	
                        printf "\n Choose Name of DataBase : "
			DisplayDatabases
			cd ./DataBases #Go to DataBases Folder		
			read databasename
			rm -r $databasename
			cd .. #Back to Project Folder  
			break ;;
        Quit)
            break 2 ;;
        *)
          echo "\ninvalid option $REPLY";;
    esac
done
echo "_________________________________________________________________________"
done



