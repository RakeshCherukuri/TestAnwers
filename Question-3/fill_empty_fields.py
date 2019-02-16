import os
import json

with open('testuser/mycode/config.json', 'r') as fr:
    credentials = json.load(fr)
with open('testuser/mycode/config.json', 'w') as fw:   
    for key, value in credentials.items():
        if value == None or value == '':
            credentials[key] = os.environ[key]
    json.dump(credentials, fw)