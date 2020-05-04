#!/bin/bash -x
declare -A store
read -p "Enter the number of times to flip coin in multiple of 3 : " totalTimes

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
store["$counter"]="${array[@]:(-3)}"
counter=$(( $counter + 1 ))
done

echo "${store[@]}"

comboOne="H H H"
comboTwo="T T T"
comboThree="H H T"
comboFour="H T T"
comboFive="H T H"
comboSix="T H H"
comboSeven="T T H"
comboEight="T H T"

comboOneCounter=0;
comboTwoCounter=0;
comboThreeCounter=0;
comboFourCounter=0;
comboFiveCounter=0;
comboSixCounter=0;
comboSevenCounter=0;
comboEightCounter=0

for j in "${store[@]}"
do
	if [[ "$j" == "$comboOne" ]]
	then
		echo "H H H"
		comboOneCounter=$(( $comboOneCounter + 1))
	elif [[ "$j" == "$comboTwo" ]]
	then
		echo 'T T T'
		comboTwoCounter=$(( $comboTwoCounter + 1 ))
	elif [[ "$j" == "$comboThree" ]]
	then
		echo "H H T"
		comboThreeCounter=$(( $comboThreeCounter + 1 ))
	elif [[ "$j" == "$comboFour" ]]
	then
		echo "H T T"
		comboFourCounter=$(( $comboFourCounter + 1 ))
	elif [[ "$j" == "$comboFive" ]]
	then
		echo "H T H"
		comboFiveCounter=$(( $comboFiveCounter + 1 ))
	elif [[ "$j" == "$comboSix" ]]
	then
		echo "T H H"
		comboSixCounter=$(( $comboSixCounter + 1 ))
	elif [[ "$j" == "$comboSeven" ]]
	then
		echo "T T H"
		comboSevenCounter=$(( $comboSevenCounter + 1 ))
	elif [[ "$j" == "$comboEight" ]]
	then
		echo "T H T"
		comboEightCounter=$(( $comboEightCounter + 1 ))
	fi
done

echo $comboOneCounter
echo $comboTwoCounter
echo $comboThreeCounter
echo $comboFourCounter
echo $comboFiveCounter
echo $comboSixCounter
echo $comboSevenCounter
echo $comboEightCounter

percentHH=$( bc <<< "scale-2;($comboOneCounter*100)/$totalTimes" )
percentTT=$( bc <<< "scale-2;($comboTwoCounter*100)/$totalTimes" )
percentHT=$( bc <<< "scale-2;($comboThreeCounter*100)/$totalTimes" )
percentTH=$( bc <<< "scale-2;($comboFourCounter*100)/$totalTimes" )
percentHH=$( bc <<< "scale-2;($comboFiveCounter*100)/$totalTimes" )
percentTT=$( bc <<< "scale-2;($comboSixCounter*100)/$totalTimes" )
percentHT=$( bc <<< "scale-2;($comboSevenCounter*100)/$totalTimes" )
percentTH=$( bc <<< "scale-2;($comboEightCounter*100)/$totalTimes" )

