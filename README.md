# run_cf User Manual

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

copy the path where you store the repository in step 1 and put it in the place of "path" in below 2 lines of code

```
testCase=$(echo "$contestId $1 0" | python "path/codeforceParser.py")
```

```
echo "$contestId $1 $i" | python "path/codeforceParser.py"
```
