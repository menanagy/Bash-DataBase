#!/usr/bin/bash
cd ./$databasename
while true
do
PS3='Enter Number of Command: '
select  choise in "Create Table" "List Table" "Drop Table" "Insert Table" "Select From Table" "Delet From Table" Quit
do
    case $choise in
        "Create Table")
			pwd
                        echo "Creat Table Choise : Enter Name of Table : "
                        read tableName
			touch $tableName.txt
                        break
                        ;;
        "List Table")
                        echo "List Table Choise : Enter Name of Table : "
                        ls -l
                        #ls -R
                        break
                        ;;
        "Drop Table")
                        echo "Drop Table Choise : Enter Name of Table : "
                        read tableName
			rm tableName
                        break
                        ;;
         "Insert Table")
                        echo "Insert Table Choise : Enter Name of DataBase : "
                        read databasename
                         rm -r $databasename
                        break
                        ;;
	"Select From Table")
                        echo "Select From Table Choise : Enter Name of DataBase : "
				break
				;;
	"Delet From Table")
			echo "Delet From Table :"
				break
				;;
	"Quit")
		cd ..
		#. ./Mysql.sh
		break 2
		;;
        *)
          echo "invalid option $REPLY";;
esac
done 
echo "_________________________________________________________________________"
done
