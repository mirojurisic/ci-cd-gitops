import os
from flask import Flask

from dotenv import load_dotenv

load_dotenv()  # Loads variables from .env

app = Flask(__name__)

# Read from environment variable
message = os.getenv("FLASK_MESSAGE", "Hello from Flask in Kubernetes!")

@app.route("/")
def hello():
    return f"{message}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
