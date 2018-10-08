#!/bin/bash

#relative file
TASKFILE=$1

#possibly just for one person
PERSON=$2

echo $TASKFILE -- $PERSON



FREQ=`head -n1 ${THING} | awk '{print $1}'`
PER=`head -n1 ${THING} | awk '{print $2}'`
POINTS=`head -n1 ${THING} | awk '{print $3}'`


if [ "${PERSON}x" = "x" ]; then
 #empty person, just sum
 echo NOPEEPS 
fi
