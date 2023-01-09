#!/bin/bash
#this file is for printing message
echo "Program to reverse the string"
USER_INPUT=${1}
if [[ -z "${USER_INPUT}" ]]
then
        echo "Please pass some input"
        exit 1
else
        for CURRENT_WORD in ${USER_INPUT};
        do

                REVERSE_WORD=$(echo ${CURRENT_WORD} | rev)
                REVERSE_SENTENCE="${REVERSE_SENTENCE} ${REVERSE_WORD}"
        done
        #convert all upercase to lowercase
        REVERSE_SENTENCE=$(echo ${REVERSE_SENTENCE} | tr '[:upper:]' '[:lower:]')
        #convert only first alphabet to uppercase
        echo ${REVERSE_SENTENCE^}
fi