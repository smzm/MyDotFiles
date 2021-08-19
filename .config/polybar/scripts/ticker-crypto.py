#!/usr/bin/python3

import requests
import json 

key = "e4ad09beeb7e39b74a4a25031fc99e1a9f755e81"
crypto= "RUNE"
url = f"https://api.nomics.com/v1/currencies/ticker?key={key}&ids={crypto}&interval=1d,30d&convert=USD&per-page=100&page=1"

# this is just for test

def ticker(url):
    try:
        res = requests.get(url)
        data = json.loads(res.text)[0]
        price = float(data["price"])
        print(f"{crypto}:{price:.2f}$")
    except requests.ConnectionError:
        print("Connection lost.")


def main():
    ticker(url)

if __name__ == "__main__":
    main()





