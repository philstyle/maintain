#!/bin/bash
#GET LAST DONE DATE
THING=$1

if [ "${THING}x" = "x" ]; then
 exit 0
fi

if [ ! -f ${THING} ]; then
 exit 0
fi

LINE=`tail -n1 ${THING}`
WHEN=`echo ${LINE} | awk '{print $1}'`
WHO=`echo ${LINE} | awk '{print $3}'`

echo $WHEN -- $WHO

