#! /bin/bash

file="./data"

sum=0

while read line1 || [ -n "$line1" ]; read line2 || [ -n "$line2" ]; read line3 || [ -n "$line3" ]; do

 echo $line1
 echo $line2
 echo $line3

for ((i=0; i<${#line1}; i++)); do
    if [[ $line2 == *${line1:i:1}* && $line3 == *${line1:i:1}* ]]
      then
        match=${line1:i:1}
        echo "success $match"
        break
    fi
  done

  alphabet=({{a..z},{A..Z}})
  for index in ${!alphabet[@]}; do
    if [[ $match == ${alphabet[$index]} ]]; 
      then 
        echo "$index"
        sum=$(($sum + $index + 1))
        
    fi
  done
  echo "------"

done <$file

echo $sum

# Notes

# Each line is a new Rucksack
# Each Rucksack has 2 compartments
# First half of word is first compartment etc
# Need to calculate priority or item that exists in both compartments