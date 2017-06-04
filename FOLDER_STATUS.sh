#!/bin/bash
#list status of things in folder
FOLDER=$1

if [ "${FOLDER}x" = "x" ]; then
 FOLDER="."
fi

for FILE in `ls -1 ${FOLDER} | grep ".mt$"`; do

 #check
 OUTPUT=`./LAST_DONE.sh ${FOLDER}/${FILE}`
 EXITVAL=$?
 #if exitval > 0, color row red
 if [ ${EXITVAL} -gt "0" ]; then
  BEGINNING="<tr style=\"background-color:#dd3b3b\"><td><form method=\"post\">"
 else
  BEGINNING="<tr style=\"background-color:#ffffff\"><td><form method=\"post\">"
 fi
 NAME=`echo ${FILE}| awk -F'.' '{print $1}'`
 END="</td><td><pre>"
 NAMES=""
 #HTML NAME
 if [ "${FOLDER}" = "." ]; then
  for PERSON in `cat PEEPS`; do
   NAMES=${NAMES}"<button name=\"BUTTON\" style=\"width:100%\;height:100%;\" value=\"${NAME}-${PERSON}\">${NAME} - ${PERSON}</button>&nbsp;&nbsp;&nbsp;&nbsp;"
  done
  NAME=${BEGINNING}${NAMES}${END}
 else
  NAME=${BEGINNING}"<button style=\"width:100%\;height:100%;" name=\"BUTTON\" value=\"${NAME}\">${NAME}</button>"${END}
 fi
 
 printf "%s" "${NAME}"
 
 
 
 printf "\t%s\t%s"  ${OUTPUT} ${EXITVAL}
 printf "</pre></form></td></tr>"
 echo ""
done
