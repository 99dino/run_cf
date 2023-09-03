#!/usr/bin/bash

# this particular script assuming the source code for the problem is written in c++ programming language, you can alter this script according to your preferred programming language ans use the executable command for those programming language where c++ code compiling and executing is done 

# stored the current working directory in variable 'directory'
directory=$(pwd)
# extracted bottom most directory from path
# which will be the ContestId
contestId="${directory##*/}"

# runnning the codeforcesParser.py to parse and return the number of set of test cases
testCase=$(echo "$contestId $1 0" | python "path/codeforceParser.py")

# compiled the source code
# $1 is the argument 1, argument 0 is script name itself while executing
g++ $1.cpp -o $1

# looping for each set of test cases
for (( i = 1 ; i <= $testCase ; i++ ))
do
    # making it work for ith set of testcases and store the input/output
    echo "$contestId $1 $i" | python "path/codeforceParser.py"

    # passed the set of input test cases to the source code while executing it with the help of pipe
    # and the storing the generated output to output.txt file
    cat inputCodeforces.txt | ./$1 > output.txt


    # comparing the output and correct answer
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