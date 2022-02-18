#!/bin/bash
#GET LAST DONE DATE
THING=$1

if [ "${THING}x" = "x" ]; then
 exit 0
fi

if [ ! -f ${THING} ]; then
 exit 0
fi


return_value() {
  INTERVAL=$1
  FREQUENCY=$2
  DAYS_SINCE_DONE=$3
  HOURS_SINCE_DONE=$4

  MAGIC_NUMBER=$((INTERVAL / FREQ))
  DIFF=$((DAYS_SINCE_DONE - MAGIC_NUMBER))
  echo $INTERVAL
}



FREQ=`head -n1 ${THING} | awk '{print $1}'`
PER=`head -n1 ${THING} | awk '{print $2}'`
POINTS=`head -n1 ${THING} | awk '{print $3}'`

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
TODAY=`echo $TODAY | sed 's/^0*//'`
THIS_SECOND=`date +%s`
YEAR=`date +%Y`
YEAR_DIFF=$((YEAR - WHEN_YEAR))
if [[ "${YEAR_DIFF}" -gt "0" ]]; then
  ADD=$((YEAR_DIFF * 365))
  TODAY=$((TODAY + ADD))
fi
DAYS_SINCE_DONE=$((TODAY - WHEN_DAY))

SECOND_DIFF=$(( THIS_SECOND - WHEN ))
HOUR_DIFF=$(( SECOND_DIFF / 3600 ))
MINUTE_DIFF=$(( SECOND_DIFF / 60 ))
MINUTE_DIFF=$(( MINUTE_DIFF % 60 ))

#might need this in the future, problem was case
#RETVAL=`return_value ${SECRET} ${FREQ} ${DAYS_SINCE_DONE} ${HOUR_DIFF}`

case $PER in
day)
  SECRET=24
  TIME_SINCE_DONE=$HOUR_DIFF
  ;;
week)
  SECRET=7
  TIME_SINCE_DONE=$DAYS_SINCE_DONE
  ;;
month)
  SECRET=30
  TIME_SINCE_DONE=$DAYS_SINCE_DONE
  ;;
*)
  SECRET=7
  TIME_SINCE_DONE=$DAYS_SINCE_DONE
  ;;
esac


MAGIC_NUMBER=$((SECRET / FREQ))
DIFF=$((TIME_SINCE_DONE - MAGIC_NUMBER))

#move mod of hour_diff until after calculations
HOUR_DIFF=$(( HOUR_DIFF % 24 ))

#printf "%s\t\t%s\t\t%s\t%s" "DATE" "TIME" "SINCE" "WHO"
#echo ""
printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s" $PRETTYDATE $DAYS_SINCE_DONE $HOUR_DIFF $MINUTE_DIFF $WHO $FREQ $PER $POINTS
#echo ""
#echo `date -r${WHEN} "+%Y-%m-%d %H:%M:%S"`" -- $DAYS_SINCE_DONE -- $WHO"
if [ $DIFF -gt 0 ]; then
 exit $DIFF 
fi
exit 0

fi
