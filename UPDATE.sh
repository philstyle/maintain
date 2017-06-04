#!/bin/bash
#UPDATE A THING
#DO NOTHING IF THING IS NOT THERE OR NO ARG

THING=$1
WHO=$2

if [ "${THING}x" = "x" ]; then
 exit 0
fi

if [ ! -f ${THING} ]; then
 exit 0
fi

date "+%s ${WHO}" >> ${THING}
git add ${THING}
git commit -m "${THING} updated by ${WHO}"
git push origin master