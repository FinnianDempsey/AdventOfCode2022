#! /bin/bash

# A = 1 = Rock
# B = 2 = Paper
# C = 3 = Scissors

# X = 0 = Lose
# Y = 3 = Draw
# Z = 6 = Win

file="./data"
sum=0


while read -r -a words || [ -n "$words" ]; do
  word1=${words[0]}
  word2=${words[1]}

  score=0
  choice=0
  echo $word1

  case $word2 in 
    "X") 
      echo "Lose"
      if [[ $word1 == "A" ]]
        then
          choice=3
      elif [[ $word1 == "B" ]]
        then 
          choice=1
      elif [[ $word1 == "C" ]]
        then 
          choice=2
      fi
      score=$(($choice))
      ;;
    "Y") 
      echo "Draw"
      choice=$(printf "%d\n" "'${word1}")
      choice=$(($choice-64))
      score=$(($choice + 3))
      ;;
    "Z")
      echo "Win"
      if [[ $word1 == "A" ]]
        then
          choice=2
      elif [[ $word1 == "B" ]]
        then 
          choice=3
      elif [[ $word1 == "C" ]]
        then 
          choice=1
      fi
      score=$(($choice + 6))
      ;;
  esac

  echo "word1: $word1"
  echo "choice: $choice"
  echo "score: $score"

  sum=$(($sum + $score))
  score=0
  echo "------"
  echo $sum
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

