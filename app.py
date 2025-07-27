#Bahar add app.py

from flask import Flask
import threading
import os

app = Flask(name)

@app.route('/')
def index():
    return 'bot is alive!'

def run():
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))

threading.Thread(target=run).start()