#!/bin/bash
#list status of things in folder
FOLDER=$1

if [ "${FOLDER}x" = "x" ]; then
 FOLDER="."
fi

for FILE in `ls -1 ${FOLDER} | grep ".mt$"`; do

 NAME=`echo ${FILE}| awk -F'.' '{print $1}'`
 BEGINNING="<tr><td><form method=\"post\">"
 END="</td><td><pre>"
 NAMES=""
 #HTML NAME
 if [ "${FOLDER}" = "." ]; then
  for PERSON in `cat PEEPS`; do
   NAMES=${NAMES}"<button name=\"BUTTON\" value=\"${NAME}-${PERSON}\">${NAME} - ${PERSON}</button>&nbsp;&nbsp;&nbsp;&nbsp;"
  done
  NAME=${BEGINNING}${NAMES}${END}
 else
  NAME=${BEGINNING}"<button name=\"BUTTON\" value=\"${NAME}\">${NAME}</button>"${END}
 fi
 
 printf "%s" "${NAME}"
# if [ ${#NAME} -lt "8" ]; then
#  printf "\t"
# fi
# if [ ${#NAME} -lt "16" ]; then
#  printf "\t"
# fi
 OUTPUT=`./LAST_DONE.sh ${FOLDER}/${FILE}`
 EXITVAL=$?
 #echo $OUTPUT ${EXITVAL}
 printf "\t%s\t%s"  ${OUTPUT} ${EXITVAL}
 printf "</pre></form></td></tr>"
 echo ""
done
