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


ISHEAD=1

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
