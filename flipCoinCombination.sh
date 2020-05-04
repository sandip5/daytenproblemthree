#!/bin/bash -x
declare -A store
read -p "Enter the number of times to flip coin : " totalTimes
isHeads=0;
isTails=1;
numberOfHeads=0;
numberOfTails=0;
j=0;
count=$totalTimes
counter=0;
while (( $count>0 ))
do
for (( i=0; i<2; i++ ))
do
	randomCheck=$(( RANDOM%2 ))
	if [[ $randomCheck -eq $isHeads ]]
	then
		((numberOfHeads++))
		winHead="H";
		array[((j++))]="$winHead"
	else
		((numberOfTails++))
		winTail="T";
		array[((j++))]="$winTail"
	fi
done
	count=$(( $count - 2 ))
echo "${array[@]}"
store["$counter"]="${array[@]:(-2)}"
counter=$(( $counter + 1 ))
done
echo "${store[@]}"
percentHead=$( bc <<< "scale-2;($numberOfHeads*100)/$totalTimes" )
percentTail=$( bc <<< "scale-2;($numberOfTails*100)/$totalTimes" )
