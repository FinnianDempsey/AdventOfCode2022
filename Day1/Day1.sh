#! /bin/bash

file="data.txt"
sum=0
largest_sum=0
largest_sum2=0
largest_sum3=0

while read line || [ -n "$line" ]; do
    if [[ ! -z "$line" ]]; 
    then
        sum=$(($sum + $line))
        # echo $line
    else 
        # echo "Sum is $sum"

        if [[ $sum -ge $largest_sum ]];
        then
            largest_sum2=$largest_sum
            largest_sum=$sum
        elif [[ $sum -ge $largest_sum2 ]]
        then
            largest_sum3=$largest_sum2
            largest_sum2=$sum
        elif [[ $sum -ge $largest_sum3 ]]
        then
            largest_sum3=$sum
        fi
        sum=0;
        # echo ' '
    fi;
    

done <$file
# echo "Sum is $sum"

# echo " "
echo "Largest sum is $largest_sum"

echo "Largest 3 sums are $largest_sum, $largest_sum2, $largest_sum3 = $(($largest_sum + $largest_sum2 + $largest_sum3))"
