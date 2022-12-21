#! /bin/bash

file="./data"
count=0

while IFS=,; read -r -a words || [ -n "$words" ]; do

    IFS='-' read -r -a numbers1 <<< "${words[0]}"
    IFS='-' read -r -a numbers2 <<< "${words[1]}"

    first1=${numbers1[0]}
    last1=${numbers1[1]}

    first2=${numbers2[0]}
    last2=${numbers2[1]}

    echo "first1: $first1"
    echo "last1: $last1"
    echo ""
    echo "first2: $first2"
    echo "last2: $last2"

    if [[ $first1 -le $first2 && $last1 -ge $last2 ]]
        then 
            echo $'1 contains 2\n'
            count=$(($count + 1))
    elif [[ $first2 -le $first1 && $last2 -ge $last1 ]]
        then
            echo $'2 contains 1\n'
            count=$(($count + 1))
    fi

    echo '---------'

done <$file

echo $count