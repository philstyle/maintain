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

 #HERE FOR TESTING ONY
 POINTS=`echo ${OUTPUT} | awk '{print $7}'`
 if [ ${POINTS} -gt "0" ]; then
  OUT=""
  for i in $(seq 1 $POINTS); do 
   OUT="${OUT}*<br>"
  done
  POINTS=$OUT
 else
  POINTS="*&nbsp;"
 fi


 #if exitval > 0, color row red
 if [ ${EXITVAL} -gt "0" ]; then
  BEGINNING="<tr style=\"background-color:#dd3b3b;vertical-align:middle\"><td><form style=\"padding-top:4%\" method=\"post\">"
 else
  BEGINNING="<tr style=\"background-color:#ffffff;vertical-align:middle\"><td><form style=\"padding-top:4%\" method=\"post\">"
 fi
 
 NAME=`echo ${FILE}| awk -F'.' '{print $1}' | sed 's/_/ /g'`
 BUTTON_NAME=`echo ${FILE}| awk -F'.' '{print $1}'`
 END="</td><td>"
 NAMES=""
 #HTML NAME
 VAL=1
 if [ "${FOLDER}" = "." ]; then
  for PERSON in `cat PEEPS`; do
   NAMES=${NAMES}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${BUTTON_NAME}-${PERSON}\"><b>${NAME}</b><br><u>${PERSON}</u></button>&nbsp;&nbsp;"
   VAL=$((VAL + 1))
  done
  NAME=${BEGINNING}${NAMES}${END}
 else
  NAME=${BEGINNING}"<button class=\"button${VAL}\" name=\"BUTTON\" value=\"${BUTTON_NAME}\">${NAME}</button>"${END}
 fi
  
 DAT=`echo ${OUTPUT} | awk '{print $1,$2}'`
 SINCE=`echo ${OUTPUT} | awk '{print $3}'`
 HSINCE=`echo ${OUTPUT} | awk '{print $4}'`
 MSINCE=`echo ${OUTPUT} | awk '{print $5}'`
 WHO=`echo ${OUTPUT} | awk '{print $6}'`
 FREQ=`echo ${OUTPUT} | awk '{print $7}'`
 PER=`echo ${OUTPUT} | awk '{print $8}'`

 printf "%s" "${NAME}"

 printf "</td><td><table><tr><td><h1>%s</h1></td></tr></table></td><td><table><tr><td><b><u>%s DAYS<br>%s HOURS<br>%s MINUTES</b></u></td><td>%s@%s</td></tr><tr><td>%s</td><td>FREQ: %s per %s</td></tr></table></td>" "${POINTS}" ${SINCE} ${HSINCE} ${MSINCE} ${DAT} ${WHO} ${FREQ} ${PER}
 printf "</form></td></tr>"
 echo ""
done
