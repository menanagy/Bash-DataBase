createDataBaseFolder(){
echo "###########################################################"
source createTable.sh
databasename="Test"
if [[ -d DataBases ]]
then
printf " \n 1)Data Base init : I Create Data Base Folder \n\n"
else
mkdir DataBases
printf " \n Data Base init : I Create Data Base Folder \n\n"
fi

}
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

checkNameExist(){
cd ./DataBases #Go to DataBases Folder
if [[ ! -d $databasename ]]; then 
	echo "please enter an existing database "
	cd .. #Back to Project Folder 
break
else
	cd ..
fi
}

checkDataBaseFolder(){
typeset -i EnterDataBase=1
cd ./DataBases 
if [[ ! -d $databasename ]]; then
	echo "please enter an existing database "
	EnterDataBase=0
else
	EnterDataBase=1
	cd ./$databasename #Go to Specific DataBase
	echo "You Are Connected Wit $databasename DataBase "
	pwd
fi
}
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

checkNameExist(){
cd ./DataBases #Go to DataBases Folder
if [[ ! -d $databasename ]]; then 
	echo "please enter an existing database "
	cd .. #Back to Project Folder 
break
else
	cd ..
fi
}

DisplayTable(){
	#list database directories ans ask for select one
	arr_Tables=($(ls)) #use the syntax ${#arr[@]} to calculate its length.
	if [[ ${#arr_databases[@]} > 0 ]]; then
		ls
		printf "\n"
        else
		printf "\n Databes is an empty ==> No Tables \n"
	fi
}

createTable(){
read table_name
#check Name of Table for str
if ! [[ $table_name =~ ^[a-zA-Z]+$ ]];
	then
	  echo "$table_name is not string value,please tray again !!"

elif [[ -f $table_name ]]; then #another if to check for the given table name
	echo "this table already exist"
else
	touch $table_name
	echo "please enter columns names sperated with a space if you want a name with a space please write it underscored"
	echo "if you are finished please press enter"
        read -a col_arr
	#col_arr > names of columns
	typeset -i i=0 # Counting Variable
        while [ $i -lt ${#col_arr[@]} ] # Loop on Columns and set Data Type
        do
		echo "for ${col_arr[i]} field ==> Choose DataType " # Type of Feild
		PS3="Choose DataType>"
		select type_option in int string
		do 
			case $type_option in
			int)
				type_arr[$i]=1; # 1==>String
	       			break;
				;;
			string)
				type_arr[$i]=2; # 2==>String
				break;
				;;
			*) echo "Inv. input"
			;;
		esac
		done
	i=$i+1
	done 
	echo ${type_arr[@]} >> $table_name # >> append
	echo ${col_arr[@]} >> $table_name # >> append
	printf "\nTable $table_name has been added successfully\n"
fi
}
