from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify({"status":"wallet service healthy"})

@app.route("/wallet")
def wallet():
    return jsonify({"service":"wallet","balance":100})

app.run(host="0.0.0.0", port=8080)
