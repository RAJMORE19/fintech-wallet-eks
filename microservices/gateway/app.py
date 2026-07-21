from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return {'message': 'FinTech Gateway Running'}

@app.route('/health')
def health():
    return {'status': 'ok'}

app.run(host='0.0.0.0', port=8080)
