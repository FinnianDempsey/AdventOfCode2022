#! /bin/bash

file="./data"

sum=0

while read -r -a words || [ -n "$words" ]; do
  word1=${words:0:${#words}/2}
  word2=${words:${#words}/2}

  for ((i=0; i<${#word1}; i++)); do
    if [[ $word2 == *${word1:i:1}* ]]
      then
        match=${word1:i:1}
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

  echo $word1
  echo $word2

  echo "------"

done <$file

echo $sum

# Notes

# Each line is a new Rucksack
# Each Rucksack has 2 compartments
# First half of word is first compartment etc
# Need to calculate priority or item that exists in both compartments