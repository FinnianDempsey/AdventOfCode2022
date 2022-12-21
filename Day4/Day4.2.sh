#! /bin/bash

file="./data"
count=0

while IFS=,; read -r -a words || [ -n "$words" ]; do

    IFS='-' read -r -a numbers1 <<< "${words[0]}"
    IFS='-' read -r -a numbers2 <<< "${words[1]}"

    first1=${numbers1[0]}
    first2=${numbers1[1]}

    second1=${numbers2[0]}
    second2=${numbers2[1]}

    echo "first1: $first1"
    echo "first2: $first2"

    echo "second1: $second1"
    echo "second2: $second2" 
    
    if [[ $first1 -lt $second1 && $first2 -lt $second1 ]];
        then 
            echo "first range is outside second range"
    elif [[ $second1 -lt $first1 && $second2 -lt $first1 ]];
        then 
            echo "second range is outside first range"
    else 
        count=$(($count + 1))
    fi

    echo '---------'

done <$file

echo $count

# Check if first2 or last2 is between first1 and last1 and vice versa
