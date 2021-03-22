echo "welcome this page"
RANDOM=$$
Hcount=0
Tcount=0
i=1
b=6
while [ $Hcount -le 6 ] | [ $Tcount -le 6 ]
do
r1=$(expr $RANDOM % 5)
r2=$(expr $r1 % 2)
if [ $r2 -eq 0 ]
then
echo -ne "Head \n"
Hcount=$(expr $Hcount + 1)
elif [ $r2 -eq 1 ]
then
echo -ne "Tail \n"
Tcount=$(expr $Tcount + 1)
fi
if [ $Hcount -eq 6 ]
then
echo "Head Win"
break
elif [ $Tcount -eq 6 ]
then
echo "Tail Win"
break
fi
i=$(expr $i + 1 )
done




#CONSTANTS
ISHEAD=1
SINGLE=1
DOUBLE=2

#STORING COMBINATIONS
declare -A singleFlip
declare -A doubleFlip



#USERINPUT
declare -A coin
read -p "Enter number of times to flip " number

#RANDOM VALUE FOR HEADS AND TAIL
for (( counter=0; counter<number; counter++ ))
do
	randomFlip=$((RANDOM%2))
	if [ $randomFlip -eq $ISHEAD 
	then
		coin[$counter]=H
		((headCount++))
		Headpercent=`echo "scale=2; $headCount*100/$number" | bc`
	else
		coin[$counter]=T
		((tailCount++))
		Tailpercent=`echo "scale=2; $tailCount*100/$number" | bc`
	fi
done
echo "Singlet Combination is "${coin[@]}
echo "Head percentage is $Headpercent%"
echo "Tail percentage is $Tailpercent%"


#FUNCTION TO CHECK DOUBLET COMBINATION
function isFlip(){
local NumberCoin=$1
for (( flip=0; flip<$flipCoin; flip++ ))
do
   for (( coin=0; coin<$NumberCoin; coin++ ))
   do
      randomCheck=$((RANDOM%2))
      if [ $randomCheck -eq $ISHEAD ]
      then
         echo "Head"
         coinSide+=H
      else
         echo "Tails"
         coinSide+=T
      fi
   done
#STORING THE COMBINATION IN DICTIONARY
   if [ $NumberCoin -eq $SINGLE ]
   then
      ((singleFlip[$coinSide]++))
      echo ${!singleFlip[@]}
   elif [ $NumberCoin -eq $DOUBLE ]
   then
      ((doubleFlip[$coinSide]++))
      echo ${!doubleFlip[@]}
   else
      echo "Invalid input"
   fi
   coinSide=""
done
}
echo "Enter 1 for Single Combination"
echo "Enter 2 for Double Combination"

#FUNCTION TO GET PERCENTAGE
function getPercent(){
local NumberCoin=$1
if [ $NumberCoin -eq $SINGLE ]
then
   for index in ${!singleFlip[@]}
   do
      singleFlip[$index]=`echo "scale=2; ${singleFlip[$index]}*100/$flipCoin" | bc`
      echo ${singleFlip[@]}
   done
elif [ $NumberCoin -eq $DOUBLE ]
then
   for index in ${!doubleFlip[@]}
   do
      doubleFlip[$index]=`echo "scale=2; ${doubleFlip[$index]}*100/$flipCoin" | bc`
      echo ${doubleFlip[@]}
   done
else
   echo "No such value"
fi
}

#SWITCH CASE FOR CHOICES
read -p "Enter your choice " choice
case $choice in
   $SINGLE)
   isFlip $SINGLE
   getPercent $SINGLE
   ;;
   $DOUBLE)
   isFlip $DOUBLE
   getPercent $DOUBLE
   ;;
*)
esac





CONSTANTS
ISHEAD=1
SINGLE=1
DOUBLE=2

#DECLARE A DICTIONARY TO STORE COMBINATIONS
declare -A singleFlip
declare -A doubleFlip

read -p "Enter how many times to flip a coin " flipCoin

#FUNCTION TO CHECK DOUBLET COMBINATION
function isFlip(){
local NumberCoin=$1
for (( flip=0; flip<$flipCoin; flip++ ))
do
   for (( coin=0; coin<$NumberCoin; coin++ ))
   do
      randomCheck=$((RANDOM%2))
      if [ $randomCheck -eq $ISHEAD ]
      then
         echo "Head"
         coinSide+=H
      else
         echo "Tails"
         coinSide+=T
      fi
   done
#STORING THE COMBINATION IN DICTIONARY
   if [ $NumberCoin -eq $SINGLE ]
   then
      ((singleFlip[$coinSide]++))
      echo ${!singleFlip[@]}
   elif [ $NumberCoin -eq $DOUBLE ]
   then
      ((doubleFlip[$coinSide]++))
      echo ${!doubleFlip[@]}
   else
      echo "Invalid input"
   fi
   coinSide=""
done
}
echo "Enter 1 for Single Combination"
echo "Enter 2 for Double Combination"

#FUNCTION TO GET PERCENTAGE
function getPercent(){
local NumberCoin=$1
if [ $NumberCoin -eq $SINGLE ]
then
   for index in ${!singleFlip[@]}
   do
      singleFlip[$index]=`echo "scale=2; ${singleFlip[$index]}*100/$flipCoin" | bc`
      echo ${singleFlip[@]}
   done
elif [ $NumberCoin -eq $DOUBLE ]
then
   for index in ${!doubleFlip[@]}
   do
      doubleFlip[$index]=`echo "scale=2; ${doubleFlip[$index]}*100/$flipCoin" | bc`
      echo ${doubleFlip[@]}
   done
else
   echo "No such value"
fi
}

#SWITCH CASE FOR CHOICES
read -p "Enter your choice " choice
case $choice in
   $SINGLE)
   isFlip $SINGLE
   getPercent $SINGLE
   ;;
   $DOUBLE)
   isFlip $DOUBLE
   getPercent $DOUBLE
   ;;
*)
esac




