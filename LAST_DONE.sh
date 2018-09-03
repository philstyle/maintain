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
PER=`head -n1 ${THING} | awk '{print $2}'`
POINTS=`head -n1 ${THING} | awk '{print $3}'`

case "$PER": in
day)
  SECRET=1
  ;;
week)
  SECRET=7
  ;;
month)
  SECRET=30
  ;;
*)
  SECRET=7
  ;;
esac

LINE=`tail -n1 ${THING}`
#SECONDS_SINCE_EPOCH WHO
WHEN=`echo ${LINE} | awk '{print $1}'`

#CHECK WHAT KIND OF DATE WE ARE WORKING WITH
DATE_TEST=`date -r1 +%s 2> /dev/null` >> /dev/null
if [ "${DATE_TEST}" != "1" ]; then
 #-r doesn't work, hope --date='@seconds' works
 WHEN_DAY=`date -d@"${WHEN}" +%j`
 WHEN_YEAR=`date -d@"${WHEN}" +%Y`
 PRETTYDATE=`date -d@"${WHEN}" "+%Y-%m-%d %H:%M:%S"`
else
 WHEN_DAY=`date -r${WHEN} +%j`
 WHEN_YEAR=`date -r${WHEN} +%Y`
 PRETTYDATE=`date -r${WHEN} "+%Y-%m-%d %H:%M:%S"`
fi

WHO=`echo ${LINE} | awk '{print $2}'`

if [ "${WHO}x" = "x" ]; then
 WHO="you"
fi

TODAY=`date +%j`
YEAR=`date +%Y`
YEAR_DIFF=$((YEAR - WHEN_YEAR))
if [ "${YEAR_DIFF}" -gt "0" ]; then
  ADD=$((YEAR_DIFF * 365))
  TODAY=$((TODAY + ADD))
fi
DAYS_SINCE_DONE=$((TODAY - WHEN_DAY))


MAGIC_NUMBER=$((SECRET / FREQ))
DIFF=$((DAYS_SINCE_DONE - MAGIC_NUMBER))

#printf "%s\t\t%s\t\t%s\t%s" "DATE" "TIME" "SINCE" "WHO"
#echo ""
printf "%s\t%s\t%s\t%s\t%s\t%s\t%s" $PRETTYDATE $DAYS_SINCE_DONE $WHO $FREQ $PER $POINTS
#echo ""
#echo `date -r${WHEN} "+%Y-%m-%d %H:%M:%S"`" -- $DAYS_SINCE_DONE -- $WHO"
if [ $DIFF -gt 0 ]; then
 exit $DIFF 
fi
exit 0

fi
