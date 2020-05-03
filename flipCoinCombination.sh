#!/bin/bash -x
declare -A store
read -p "Enter the number of times to flip coin : " totalTimes
isHeads=0;
isTails=1;
numberOfHeads=0;
numberOfTails=0;
count=$totalTimes
counter=0;
while (( $count>0 ))
do
	randomCheck=$(( RANDOM%2 ))
	if [[ $randomCheck -eq $isHeads ]]
	then
		((numberOfHeads++))
		winFace="H";
	else
		((numberOfTails++))
		winFace="T";
	fi
	((count--))
store["$counter"]="$winFace"
counter=$(( $counter + 1 ))
done
echo "${store[@]}"
percentHead=$( bc <<< "scale-2;($numberOfHeads*100)/$totalTimes" )
percentTail=$( bc <<< "scale-2;($numberOfTails*100)/$totalTimes" )
