#!/bin/bash


for FILE in `git status --porcelain | grep M | awk '{print $2}'`; do
 echo $FILE 
done

#git add ${THING}
#git commit -m "${THING} updated by ${WHO}"
#git push origin master