#!/bin/bash

#relative file
TASKFILE=$1

#possibly just for one person
PERSON=$2

echo $TASKFILE -- $PERSON



FREQ=`head -n1 ${TASKFILE} | awk '{print $1}'`
PER=`head -n1 ${TASKFILE} | awk '{print $2}'`
POINTS=`head -n1 ${TASKFILE} | awk '{print $3}'`




case $PER in
day)
  SECRET=24
  ;;
week)
  SECRET=7
  ;;
month)
  SECRET=30
  ;;
year)
  SECRET=365
  ;;
*)
  SECRET=7
  ;;
esac

MAGIC_NUMBER=$((SECRET / FREQ))

if [ "${PERSON}x" = "x" ]; then
 #empty person, just sum
 echo NOPEEPS 
fi
 echo $FREQ $PER $POINTS $SECRET $MAGIC_NUMBER
