#!/bin/bash
#this program will count the number of words in a file
echo "This program will count the occurence of word in a given file"
read -p "Enter your file name: " INPUT_FILE
#INPUT_FILE=${1}
#check if file name is passed or not
if [[ -z ${INPUT_FILE} ]]
then
        echo "Please pass some file name."
        exit 1
fi
#check if file exist or not
if test -f "$INPUT_FILE"
then
        FILE_DATA=$(cat ${INPUT_FILE})
        if [[ -z ${FILE_DATA} ]] #check if file is empty
        then
                echo "This file is empty"
                exit 1
        else
                echo "This file not empty"
        fi
else
        echo "${INPUT_FILE} file does not exist"
        exit 1
fi
#echo "$(cat ${INPUT_FILE})"
echo "printing data"
FILE_DATA=$(cat ${INPUT_FILE} | uniq -i)
echo "$FILE_DATA"
cat ${1} | tr '[:upper:]' '[:lower:]' | tr " " '\n' | sort | uniq -c | sort -nr | awk -F ' ' '{print $2 " " $1}' | tr '\n' ' '