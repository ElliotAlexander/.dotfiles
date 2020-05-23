#!/usr/bin/python

import requests
import os.path


save_path = '/home/elliot/.config/polybar/polynews/'

api_key = "0d0b96f65523482bbdeea8552982f47f"

sources = ""
country = "gb"

try:
    data = requests.get('https://newsapi.org/v2/top-headlines?apiKey='+api_key+'&country='+country).json()

    sourceName = data['articles'][0]['source']['name']
    title = data['articles'][0]['title']
    url = data['articles'][0]['url']

    print(sourceName+': '+title)

    path = os.path.join(save_path,"current_url.txt")         
    f = open(path, "w")
    f.write(url)
    f.close()
    
 
except requests.exceptions.RequestException as e:
    print ('Something went wrong!')


