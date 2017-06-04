#!/bin/bash
#GET LAST DONE DATE
THING=$1

if [ "${THING}x" = "x" ]; then
 exit 0
fi

if [ ! -f ${THING} ]; then
 exit 0
fi

FREQ=`head -n1 ${THING} | awk '{print $1}'`

LINE=`tail -n1 ${THING}`
#SECONDS_SINCE_EPOCH WHO
WHEN=`echo ${LINE} | awk '{print $1}'`
WHEN_DAY=`date -r${WHEN} +%j`
WHO=`echo ${LINE} | awk '{print $2}'`
TODAY=`date +%j`
#will run into issues around the newyear if you only track 'day of year'
DAYS_SINCE_DONE=$((TODAY - WHEN_DAY))
if [ $DAYS_SINCE_DONE -lt 0 ]; then
 #different year?
 DAYS_SINCE_DONE=$((365 + DAYS_SINCE_DONE))
fi

MAGIC_NUMBER=$((7 / FREQ))
DIFF=$((DAYS_SINCE_DONE - MAGIC_NUMBER))
#printf "%s\t\t%s\t\t%s\t%s" "DATE" "TIME" "SINCE" "WHO"
#echo ""
printf "%s\t%s\t%s\t%s" `date -r${WHEN} "+%Y-%m-%d %H:%M:%S"` $DAYS_SINCE_DONE $WHO
#echo ""
#echo `date -r${WHEN} "+%Y-%m-%d %H:%M:%S"`" -- $DAYS_SINCE_DONE -- $WHO"
if [ $DIFF -gt 0 ]; then
 exit $DIFF 
fi
exit 0