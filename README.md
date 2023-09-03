# run_cf User Manual

Note: This particular script assuming the source code for the problem is written in c++ programming language, you can alter this script according to your preferred programming language ans use the executable command for those programming language where c++ code compiling and executing is done.

## Requirements

Requires **request** and **bs4** library.
Run the following commands in the terminal :

**for windows**

```
pip install bs4
pip install requests
```

**for linux/unix**

```
pip3 install bs4
pip3 install requests
```

## Steps to setup

1. Download this repository and put it somewhere in your PC(remember the path of this repository).

2. Open run.sh script in notepad or in any text editor.

3. Copy the path where you store the downloaded repository in step 1 and put it in the place of "path" in below 2 lines of code present in run.sh script.

```
testCase=$(echo "$contestId $1 0" | python "path/codeforceParser.py")
```

```
echo "$contestId $1 $i" | python "path/codeforceParser.py"
```

4. For Linux/Unix OS users, replace "python" with "python3" in above 2 lines of code present in run.sh script.

5. **Setting up the environment path variable** to make it accessible from any directory.

## How to Use it

1. Create a directory with the name same as of ContestId.
2. create a source code file with the name same as A,B,C,D...(like A.cpp, or B.py, or C.java).
3. To run the script file for A.cpp or A.py or A.java

```
run.sh A
```
