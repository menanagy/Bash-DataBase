#!/usr/bin/bash
databasename="Test"
if [[ -d DataBase ]]
then
echo "Data Base init : I Create Data Base Folder "
else
mkdir DataBase
echo "Data Base init : I Create Data Base Folder "
fi
cd ./DataBase

while true
do	
PS3='Enter Number of Command: '
select  choise in "Create Database" "List DataBase" "Connect DataBashe" "Drop DataBase" Quit
do
    case $choise in
        "Create Database")
			echo "Enter Name of DataBase : "
			read databasename
           		mkdir $databasename
			break
           		  ;;
        "List DataBase")
           		ls -F | grep \/$
			#ls -R
			break
           		;;
	"Connect DataBashe")
                        echo "Enter Name of DataBase : "
			read databasename
			. ./database.sh
			break ;;
	 "Drop DataBase")
                        echo "Enter Name of DataBase : "
			read databasename
			 rm -r $databasename
			break ;;
        Quit)
            break 2 ;;
        *)
          echo "invalid option $REPLY";;
    esac
done
echo "_________________________________________________________________________"
done
