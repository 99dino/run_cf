#!/usr/bin/bash
path=$(pwd)
contestId="${path##*/}"
testCase=$(echo "$contestId $1 0" | python "/path/codeforceParser.py")

g++ $1.cpp -o $1
for (( i = 1 ; i <= $testCase ; i++ ))
do
    echo "$contestId $1 $i" | python "/path/codeforceParser.py"

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
done
# to hold the shell for 5 seconds before auto closing
sleep 5