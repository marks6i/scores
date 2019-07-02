from fastapi import FastAPI

import urllib3
import xmltodict

app = FastAPI()
    
SCORES_URL = 'https://www.scorespro.com/rss2/live-baseball.xml'

@app.get("/scores")
def get_scores():

    http = urllib3.PoolManager()
    response = http.request('GET', SCORES_URL)
    obj = xmltodict.parse(response.data.decode('utf-8'))

    return obj
