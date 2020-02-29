#!/usr/bin/bash
source functions.sh
#pwd
checkDataBaseFolder

while true #[$EnterDataBase -eq 1]
do
PS3='Enter Number of Command: '
select  choise in "Create Table" "List Table" "Drop Table" "Insert Table" "Select From Table" "BacK"
do
    case $choise in
        "Create Table")
			printf "Old Tables : "
			DisplayTable
                        printf "\n Enter Name of New Table : "
			createTable
                        break
                        ;;
        "List Table")
                        printf "List of Tables :"
			DisplayTable
                        break
                        ;;
        "Drop Table")
                        printf "\n Lists of  Table Choose one for Dropping : "
			DisplayTable
                        read tableName
			rm $tableName
			#rm $tableName.data
                        break
                        ;;
         "Insert Table")
			DisplayTable
			
			arr_tables=($(ls))
			if [[ ${#arr_tables[@]} > 0 ]]; then
				printf " Old Table : "
				echo ${arr_tables[@]}
                        	printf "\nInsert Table Choise : Enter Name of Table : "
				read tableName
				if [[ -f $tableName ]]; then
					read -a arr_data_type <<< `sed '1!d' $tableName`
					read pk <<< `sed '2!d' $tableName`
					read -a arr_col_names <<< `sed '3!d' $tableName`
					echo "Enter Valid Value of Col :"
					echo ${arr_col_names[@]}
					#take cols data and check data type and pk
					typeset -i i=0
					while [[ $i -lt ${#arr_data_type[@]} ]] #==> Loop 1
					do	
						#case of int
						if [[ arr_data_type[i] -eq 1 ]]; then
							while [ true ]
							#echo $intFlage
							do
								if [[ $i == $pk ]];then
									echo "This is a primary key Field"
								else 
									echo "This is not a primary key  Field"
								fi

								printf "Enter Value  of ${arr_col_names[i]} (is integer)'\n"
								read userData
								if ! [[ $userData =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
								  	echo "$userData is not an integer value,please try again !!"
								else
									if [[ $i == $pk ]]; then
										#echo "it is integer primrary Key"
										checkPrimaryKey	
									else
										#echo "it is not primary key"
										userInsertArray[i]="$userData" #append in userInsertArray[i]
										printf "\n$userData has been added successfully\n"	
									fi
									break #to another col
								fi
								
							done						
						else #case of string	
							while [ true ]
							do
								if [[ $i == $pk ]];then
									echo "This is a primary key Field"
								else 
									echo "This is not a primary key  Field"
								fi
								printf "Enter Value  of ${arr_col_names[i]} (is String)'\n"
								read userData
								if ! [[ $userData =~ ^[a-zA-Z]+$ ]]; then
									echo "$userData is not string value,please try again !!"
								else
									if [[ $i == $pk ]]; then
										#echo "it is String primrary Key"
										checkPrimaryKey						
									else
										#echo "it is not primary key"
										userInsertArray[i]="$userData" #append in userInsertArray[i]
										printf "\n$userData has been added successfully\n"	
									fi
									break #to another col
								fi
								
							done			
						fi
					i=$i+1 #increment index
					done
					echo ${userInsertArray[@]} >> $tableName
					printf "\nThe record has been added successfully\n"
					echo ${userInsertArray[@]}
				else
					echo "Sorry  Table Name Not Found"				
				fi
			else
				echo "Sorry No Table please Enter ==> 1 for Create Table"			
			fi			

                        break
                        ;;
	"Select From Table")			
                        printf "\n Lists of  Table Choose one for Display : \n"
			DisplayTable
			read tableName
			sed '1,2d' $tableName 
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
echo "Finish While"


