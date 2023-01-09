#!/bin/bash

# first define global variables
PRINT_ALGO=false
PRINT_TEXT=false
VAL


# now check getopts for passed parameters
while getopts "atv:" OPTION
do
	case "${OPTION}" in
	a)
	    PRINT_ALGO=true
	;;	
    t)
	    PRINT_TEXT=true
	;;
    v)
        VAL="${OPTARG}"
	esac
done

# list of algos 
ALGOS="sha1sum sha224sum sha256sum sha384sum sha512sum"
ALGO_ARRAY=($ALGOS)

# Now run for each algo
for i in "${ALGO_ARRAY[@]}"
do
    if $PRINT_ALGO
        then
            echo "Algo name: ${i}"
    fi
    if $PRINT_TEXT
        then
            echo "Text: ${VAL}"
    fi
    TEMP=$(echo "${VAL}" | ${i} | head -c20)
	echo "Password : ${TEMP}"
done

exit