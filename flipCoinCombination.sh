#!/bin/bash -x
declare -A store
read -p "Enter the number of times to flip coin in multiple of 2 : " totalTimes

isHeads=0;
isTails=1;
numberOfHeads=0;
numberOfTails=0;
arrayCount=0;
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
			array[((arrayCount++))]="$winHead"
		else
			((numberOfTails++))
			winTail="T";
			array[((arrayCount++))]="$winTail"
		fi
	done
count=$(( $count - 2 ))
echo "${array[@]}"
store["$counter"]="${array[@]:(-2)}"
counter=$(( $counter + 1 ))
done

echo "${store[@]}"

comboOne="H H"
comboTwo="T T"
comboThree="H T"
comboFour="T H"

comboOneCounter=0;
comboTwoCounter=0;
comboThreeCounter=0;
comboFourCounter=0;

for j in "${store[@]}"
do
	if [[ "$j" == "$comboOne" ]]
	then
		echo "H H"
		comboOneCounter=$(( $comboOneCounter + 1))
	elif [[ "$j" == "$comboTwo" ]]
	then
		echo 'T T'
		comboTwoCounter=$(( $comboTwoCounter + 1 ))
	elif [[ "$j" == "$comboThree" ]]
	then
		echo "H T"
		comboThreeCounter=$(( $comboThreeCounter + 1 ))
	elif [[ "$j" == "$comboFour" ]]
	then
		echo "T H"
		comboFourCounter=$(( $comboFourCounter + 1 ))
	fi
done

echo $comboOneCounter
echo $comboTwoCounter
echo $comboThreeCounter
echo $comboFourCounter

percentHH=$( bc <<< "scale-2;($comboOneCounter*100)/$totalTimes" )
percentTT=$( bc <<< "scale-2;($comboTwoCounter*100)/$totalTimes" )
percentHT=$( bc <<< "scale-2;($comboThreeCounter*100)/$totalTimes" )
percentTH=$( bc <<< "scale-2;($comboFourCounter*100)/$totalTimes" )

