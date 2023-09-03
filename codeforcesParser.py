import requests
from bs4 import BeautifulSoup

def main():
    inf = input()
    inf = inf.split(" ")

    url = "https://codeforces.com/contest/ID/problem/N"

    url = url.replace('ID', inf[0])
    url = url.replace('N', inf[1].upper())

    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, "html.parser")
        pre_elements = soup.find_all("pre")

if __name__ == "__main__":
    main()
