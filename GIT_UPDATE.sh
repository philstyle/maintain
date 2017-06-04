#!/bin/bash


for FILE in `git status --porcelain | grep "^ M" | awk '{print $2}'`; do
 LASTLINE=`tail -n1 ${FILE}`
 git add $FILE && git commit -m "${FILE} -- ${LASTLINE}"
done

#git add ${THING}
#git commit -m "${THING} updated by ${WHO}"
#git push origin master