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
  BEGINNING="<td style=\"background-color:#dd3b3b;vertical-align:middle\"><form style=\"padding-top:4%\" method=\"post\">"
 else
  BEGINNING="<td style=\"background-color:#4CAF50;vertical-align:middle\"><form style=\"padding-top:4%\" method=\"post\">"
 fi
 
  POINTS=`echo ${OUTPUT} | awk '{print $9}'`
 if [ ${POINTS} -gt "0" ]; then
  OUT=""
  for i in $(seq 1 $POINTS); do
   OUT="${OUT}*&nbsp;"
  done
  POINTS=$OUT
 else
  POINTS="*&nbsp;"
 fi


NAME=`echo ${FILE}| awk -F'.' '{print $1}' | sed 's/_/ /g'`
 BUTTON_NAME=`echo ${FILE}| awk -F'.' '{print $1}'`
 END="<br>${POINTS}</td><td>"
 NAMES=""
 #HTML NAME
 VAL=1
 if [ "${FOLDER}" = "." ]; then
  NAMES=${NAMES}"<b>${NAME}</b><br>"
  for PERSON in `cat PEEPS`; do
   NAMES=${NAMES}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${BUTTON_NAME}-${PERSON}\"><u>${PERSON}</u></button>&nbsp;&nbsp;"
   VAL=$((VAL + 1))
  done
  NAME=${BEGINNING}${NAMES}${END}
 else
  NAME=${BEGINNING}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${BUTTON_NAME}\">${NAME}</button>"${END}
 fi
  

 printf "%s" "${NAME}"
 printf "</form>"
 if [ $COUNT -eq $COLUMNS ]; then
  echo "</tr><tr>"
  COUNT=0
 else
  COUNT=$(( COUNT + 1 ))
 fi

done
