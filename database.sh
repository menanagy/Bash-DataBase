#!/usr/bin/bash
pwd
cd ./DataBases/$databasename #Go to Specific DataBase
DisplayTable(){
	#list database directories ans ask for select one
	arr_databases=($(ls)) #use the syntax ${#arr[@]} to calculate its length.
	if [[ ${#arr_databases[@]} > 0 ]]; then
		ls
        else
		printf "\n Databes is an empty ==> No Tables \n"
	fi
}

while true
do
PS3='Enter Number of Command: '
select  choise in "Create Table" "List Table" "Drop Table" "Insert Table" "Select From Table" "Delet From Table" "BacK"
do
    case $choise in
        "Create Table")
                        printf "\nCreat Table Choise : Enter Name of Table : "
                        read tableName
			touch $tableName
			touch $tableName.data
                        break
                        ;;
        "List Table")
                        printf "\n Lists of Table\n"
			DisplayTable
                        break
                        ;;
        "Drop Table")
                        printf "\n Lists of  Table Choose one for Dropping : "
			DisplayTable
                        read tableName
			rm $tableName
			rm $tableName.data
                        break
                        ;;
         "Insert Table")
                        printf "\nInsert Table Choise : Enter Name of DataBase : "
                        break
                        ;;
	"Select From Table")
			
                        printf "\n Lists of  Table Choose one for Display : \n"
			DisplayTable
			read tableName
			cat tableName
			break
			;;
	"Delet From Table")
			printf "\n Delet From Table : \n"
				break
				;;
	"BacK")
		cd .. #Back to DataBases Folder
		break 2
		;;
        *)
          echo "\n invalid option $REPLY";;
esac
done 
echo "_________________________________________________________________________"
done
