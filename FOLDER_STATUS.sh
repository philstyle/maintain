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
 END="</td><td>"
 NAMES=""
 #HTML NAME
 VAL=1
 if [ "${FOLDER}" = "." ]; then
  for PERSON in `cat PEEPS`; do
   NAMES=${NAMES}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${NAME}-${PERSON}\">${NAME} - ${PERSON}</button>"
   VAL=$((VAL + 1))
  done
  NAME=${BEGINNING}${NAMES}${END}
 else
  NAME=${BEGINNING}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${NAME}\">${NAME}</button>"${END}
 fi
 
 printf "%s" "${NAME}"
 
 DAT=`echo ${OUTPUT} | awk '{print $1,$2}'`
 SINCE=`echo ${OUTPUT} | awk '{print $3}'`
 WHO=`echo ${OUTPUT} | awk '{print $4}'`
 FREQ=`echo ${OUTPUT} | awk '{print $5}'`
 
 printf "%s DAYS ago</td><td>%s@%s</td><td>%s</td><td> %s " ${SINCE} ${DAT} ${WHO} ${FREQ}
 printf "</form></td></tr>"
 echo ""
done
