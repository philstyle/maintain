#!/bin/bash
#list status of things in folder
FOLDER=$1

if [ "${FOLDER}x" = "x" ]; then
 FOLDER="."
fi

for FILE in `ls -1 ${FOLDER} | grep ".mt$"`; do

 NAME=`echo ${FILE}| awk -F'.' '{print $1}'`
 #HTML NAME
 NAME="<form method=\"post\"><p> <button name=\"button\">${NAME}</button>"
 printf "%s" "${NAME}"
 if [ ${#NAME} -lt "8" ]; then
  printf "\t"
 fi
 if [ ${#NAME} -lt "16" ]; then
  printf "\t"
 fi
 OUTPUT=`./LAST_DONE.sh ${FOLDER}/${FILE}`
 EXITVAL=$?
 #echo $OUTPUT ${EXITVAL}
 printf "\t%s\t%s"  ${OUTPUT} ${EXITVAL}
 printf "</p></form>"
 #echo ""
done