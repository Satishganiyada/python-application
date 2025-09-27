from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Flask Web Application!"

@app.route("/about")
def about():
    return "This is a simple Python web application."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
