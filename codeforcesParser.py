import requests
from bs4 import BeautifulSoup


def addToTempFile(content):
    # temporary file is output.txt which can be later used to store
    # the actual output of the source code for the particular problem
    output = open('output.txt', 'w')
    if content.find("div"):
        div_text = content.find_all("div")
        for div in div_text:
            output.write(div.get_text()+"\n")
            # print(div.get_text())
    else:
        output.write(content.get_text()+"\n")
        # print(content.get_text())

    output.close()


def formatContent(file):
    output = open('output.txt', 'r')
    for line in output.readlines():
        if (len(line.strip())):
            file.write(line)
    output.close()

def main():
    inf = input()
    inf = inf.split(" ")
    # input contains the ContestId and a,b,c,d... problem number with same file name

    # URL template
    url = "https://codeforces.com/contest/ID/problem/N"
    # making a legit url of a specific problem page of codeforces
    # like in folder name 1846 and source code a.cpp
    # then problem page will be contestId 1846 and problem A
    url = url.replace('ID', inf[0])
    url = url.replace('N', inf[1].upper())

    # parsing starts from here
    response = requests.get(url)
    if response.status_code == 200:
        # parsed successfully
        soup = BeautifulSoup(response.text, "html.parser")
        # finding the <pre> element on codeforces problem page which contains only sample input and output correspondingly  
        pre_elements = soup.find_all("pre")
        
        # For a set of test case there will be 2 <pre> elements, so 0th index will be the one containing input and 1st index will be having ouput of that

        # Input in temporary file
        inputTestCase = pre_elements[0]
        addToTempFile(inputTestCase)

        # Formatting the input content
        inpFile = open('inputCodeforces.txt', 'w')
        formatContent(inpFile)
        inpFile.close()

        # Output in temporary file
        outputAnswer = pre_elements[1]
        addToTempFile(outputAnswer)

        # Formatting the output content
        outFile = open('outputCodeforces.txt', 'w')
        formatContent(outFile)
        outFile.close()
    
    else:
        print("Failed to fetch the webpage")

if __name__ == "__main__":
    main()