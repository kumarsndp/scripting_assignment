#!/bin/bash
#this program will find the meeting agenda
echo "This  program will find the agenda  of the meeting from the given file"
#read -p "Enter the file name which contains the agenda: " AGENDA_FILE
#check if file name is passed or not
if [[ -z ${AGENDA_FILE} ]]
then
        echo "Please enter file name."
        exit 1
fi

#check if file exists or not
if test -f "$AGENDA_FILE"
then
        for i in $( grep -A1 -i --no-group-separator 'Today\|Tomorrow' ${AGENDA_FILE} )
        do
                if [[ "${i}" == 'Today' || "${i}" == 'Tomorrow' ]]
                then
                        FILE="${FILE} ${LINE}"
                        LINE="\n${i} : "
                else
                        LINE="${LINE} ${i}"
                fi
        done
        FILE="${FILE} ${LINE}"
        echo -e ${FILE} | sort -k1 | column  -t -s :
else
        echo "${AGENDAT_FILE} does not exist"
        exit 1
fi