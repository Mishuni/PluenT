"""
utils for mnt service 
"""
import os
import re
import json
import requests
from bs4 import BeautifulSoup

# checker 
def checkStopword(s):
    stopword = ["\"","$","&","'","(",")","*","+",",","-",";","<","=",">","@","\\","^","_","`","|","~","·","—","——","‘","’","“","”","…","、","。","〈","〉","《","》"]
    return s in stopword

def checkLen(text):
    return (len(text) < 500)

def checkSpellKo(text):
    checkedText = []
    #parameter type is string
    if isinstance(text,str):
        if checkLen(text):
            return getCorrectedKo(text)
        else:
            pass
    #parameter type is list
    else:
        #rec
        for t in text:
            checked = checkSpellKo(t)
            checkedText.append(checked)

    return checkedText

def getCorrectedKo(q):
    #completed
    #use naver API
    q = q
    callback = "jQuery112404813373148364377_1581593168003"
    url = "https://m.search.naver.com/p/csearch/ocontent/util/SpellerProxy?_callback=" + callback + '&q=' + q + "&where=nexearch&color_blindness=0&_=1581593168005"

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36'
    }

    response = requests.get(url, headers=headers).text
    response = response.replace(callback + '(', '')
    response = response.replace(');', '')
    response_dict = json.loads(response)
    checked = response_dict['message']['result']['html']
    checked = BeautifulSoup(checked, "html.parser").text
    return checked
