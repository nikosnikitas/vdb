#!/usr/bin/bash

#	Vet DBMS - shell version
#	Author: Nikos-Nikitas
#	GitHub: https://github.com/nikosnikitas

# Gets only an integer number.
getInt() {
	printf "Choose an option.\n> "
	read INT_INPUT
	
	if ! [[ $INT_INPUT =~ ^[0-9]+$ ]]; then
		printf "Insert only an INTEGER NUMBER.\n"
	fi
}

# The main menu.
menu() {
	local line="------------------------------"
	printf "Vet Database Management System\n"
	echo $line
	printf "Author: Nikos-Nikitas\n"
	printf "GitHub: https://github.com/nikosnikitas\n"
	echo $line
	echo "Main Menu"
	echo $line
	printf "1) Add Pet Data.\n2) View Pet Data\n3) Exit\n"
	
	c=getInt

	case $c in 
	
		1)
			getPetData
			;;
		3)
			exit
			;;

		*)
			printf "Please insert 1, 2 or 3.\n"
			;;
	esac
	
}

main() {

	menu

	if [[ -e "vetdb.txt" ]]; then 
		echo "Database exists."
	else
		cat "vetdb.txt"
		echo "Created Database successfully!"
	fi

	echo -n "Do you want to overwrite data? (y/n): "
	read -n 1 CHOICE

	if [ ${CHOICE,,} == "y" ]; then
		echo
		cat > vetdb.txt << EOF
		PET DATA
		========
		Pet Name: $PET_NAME
		Pet Species: $PET_SPECIES
		Pet age: $PET_AGE
		Pet gender: $PET_GENDER
EOF

	elif [ ${CHOICE,,} == "n" ]; then
		echo
		cat >> vetdb.txt << EOF
		PET DATA
		========
		Pet Name: $PET_NAME
		Pet Species: $PET_SPECIES
		Pet age: $PET_AGE
		Pet gender: $PET_GENDER
EOF

	else
		echo "Enter Y/y(es) or N/n(o)."
	fi

	cat "a.txt"
}

# Getting data from file.
getPetData() {
	read -p "What is your Pet's name? " PET_NAME
	read -p "What is your Pet's species? " PET_SPECIES
	read -p "What is your Pet's age? " PET_AGE
	read -p "What is your Pet's gender? " PET_GENDER
}

main