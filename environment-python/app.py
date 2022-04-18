#!/usr/bin/python3

from flask import Flask
app = Flask(__name__)

from src.rest import routes

app.run(debug=True, host='0.0.0.0')
