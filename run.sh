#!/usr/bin/bash
path=$(pwd)
contestId="${path##*/}"


g++ $1.cpp -o $1
echo "$contestId $1" | python "/path/codeforceParser.py"

cat inputCodeforces.txt | ./$1 > output.txt
