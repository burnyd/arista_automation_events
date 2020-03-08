from flask import Flask, request, send_from_directory, url_for
import os
import json

app = Flask(__name__, static_url_path='/static')

@app.route('/testing')
def example():
   return 'test worked'

@app.route('/api/<path:filename>', methods = ['GET', 'POST', 'PATCH', 'PUT', 'DELETE'])
def api(filename):
    cwd = os.getcwd() #Get current working directory
    if request.method == 'GET':
        with open(cwd+"/"+filename, "r") as f:
            return f.read()
            f.close()

    if request.headers['Content-Type'] == 'application/json':
        with open(cwd+"/"+filename, "r") as f:
            return f.read()
            f.close()

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')


#static/allvars.json
