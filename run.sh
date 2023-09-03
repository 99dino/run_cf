#!/usr/bin/bash
path=$(pwd)
contestId="${path##*/}"


g++ $1.cpp -o $1
echo "$contestId $1" | python "/path/codeforceParser.py"

cat inputCodeforces.txt | ./$1 > output.txt
file1="output.txt"
file2="outputCodeforces.txt"

if cmp -s "$file1" "$file2";
then
    echo -e "All TestCase Passed.\n"
else
    echo -e "Wrong Answer.\n"
    #cmp "$file1" "$file2"
fi
