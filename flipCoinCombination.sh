#!/bin/bash -x

isHead=0;
randomCheck=$(( RANDOM%2 ))

if [[ isHead -eq randomCheck ]]
then
	echo "Head"
else
	echo "Tail"
fi
