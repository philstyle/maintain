#!/bin/bash
#list status of things in folder
FOLDER=$1

if [ "${FOLDER}x" = "x" ]; then
 FOLDER="."
fi
COLUMNS=4
COUNT=0
for FILE in `ls -1 ${FOLDER} | grep ".mt$"`; do
 #check
 OUTPUT=`./LAST_DONE.sh ${FOLDER}/${FILE}`
 EXITVAL=$?

 #if exitval > 0, color row red
 if [ ${EXITVAL} -gt "0" ]; then
  BEGINNING="<td style=\"background-color:#dd3b3b;vertical-align:middle\">"
 else
  BEGINNING="<td style=\"background-color:#4CAF50;vertical-align:middle\">"
 fi
 
 NAME=`echo ${FILE}| awk -F'.' '{print $1}' | sed 's/_/ /g'`
 BUTTON_NAME=`echo ${FILE}| awk -F'.' '{print $1}'`
 END="</td>"
 NAMES=""
 #HTML NAME
 VAL=1
 NAME=${BEGINNING}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${BUTTON_NAME}\">${NAME}</button>"${END}
  

 printf "%s" "${NAME}"

 if [ $COUNT -eq $COLUMNS ]; then
  echo "</tr><tr>"
  COUNT=0
 else
  COUNT=$(( COUNT + 1 ))
 fi

done
