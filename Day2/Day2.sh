#! /bin/bash

# A = X = 1 = Rock
# B = Y = 2 = Paper
# C = Z = 3 = Scissors
file="./data"
sum=0


while read -r -a words || [ -n "$words" ]; do
  word1=${words[0]}
  word2=${words[1]}

  num1=$(printf "%d\n" "'${word1}")
  num2=$(printf "%d\n" "'${word2}")

  score=0

  # Translate ascii value to start at 1
  num1=$(($num1-64))
  num2=$(($num2-87))

  echo $num1
  echo $num2

  if [[ $num1 -eq $num2 ]]
    then 
      echo "Tie" && score=$(($num2 + 3))
  elif [[ $num1 -eq "1" && $num2 -eq "3" ]]
   then
    echo "player 1 wins (R beats S)" && score=$(($num2))
  elif [[ $num1 == "3" && $num2 == "1" ]]
   then
    echo "player 2 wins (R beats S)" && score=$(($num2 + 6))
  elif [[ $num1 == "3" && $num2 == "2" ]]
   then
    echo "player 1 wins (S beats P)" && score=$(($num2))
  elif [[ $num1 == "2" && $num2 == "3" ]]
   then
    echo "player 2 wins (S beats P)" && score=$(($num2 + 6))
  elif [[ $num1 == "2" && $num2 == "1" ]]
   then
    echo "player 1 wins (P beats R)" && score=$(($num2))
  elif [[ $num1 == "1" && $num2 == "2" ]]
    then
      echo "player 2 wins (P beats R)" && score=$(($num2 + 6))
  fi
  

  echo $score
  echo $sum
  sum=$(($sum + $score))
  
  echo "------"

done <$file



echo $sum


# Notes

# Rock beats Scissors 
# Scissors beats Paper
# Paper beats Rock

# Rock = 1 point
# Paper = 2 points
# Scissors = 3 points

# Win = 6
# Draw = 3
# Loss = 0

# A = Rock
# B = Paper
# C = Scissors

# Total score = Shape Selected + Outcome of Round

