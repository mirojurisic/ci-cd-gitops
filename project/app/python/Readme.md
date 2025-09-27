1. Build Docker Image

From your project root:

# Replace with local tag
```
docker build -t flask-app:local .
```

flask-app:local is just a local tag for testing.

2. Run Docker Container Locally
a) Using environment variables from .env:

Make sure .env exists in project root:

FLASK_MESSAGE=Hello from Docker container!


Run container:
```
docker run --rm -p 5000:5000 --env-file .env flask-app:local
```
--rm removes container after stopping.

-p 5000:5000 maps container port 5000 → localhost:5000.

--env-file .env injects environment variables.