Dockerized Python Flask Application

This project demonstrates how to **containerize a simple Python Flask application using Docker**.
It includes:

* A minimal Flask API (`/` and `/health` endpoints)
* A `Dockerfile` for building the image
* A `docker-compose.yml` file
* Shell/PowerShell scripts to build and run the container
* Screenshots showing the app running on **localhost:5000**

---

## 📁 Project Structure

```
Docker Flask/
│── app.py
│── Dockerfile
│── docker-compose.yml![Uploading Screenshot (10).png…]()

│── requirements.txt
│── requirement.txt          # duplicate (for testing)
│── run.ps1                  # PowerShell automation script
│── verify.ps1               # PowerShell verify script
│── demo_project.sh          # Shell script for Linux/Mac
```

---

## 🧠 Flask Application (app.py)

The application exposes two endpoints:

```python
@app.route('/')
def hello():
    return "Hello from Flask inside Docker!"

@app.route('/health')
def health():
    return jsonify(status='ok')
```

Runs on **0.0.0.0:5000** so it works inside Docker.

---

## 🐳 Dockerfile

The Dockerfile installs dependencies, copies the app, and runs it using Gunicorn:

```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
```

---

## 🐳 Docker Compose (docker-compose.yml)

```yaml
version: '3.8'

services:
  flask-app:
    build: .
    container_name: flask-docker-example
    ports:
      - "5000:5000"
```

---

## ▶️ Run the Application

### **Option 1 — Run using Docker Compose (recommended)**

```bash
docker compose up --build
```

Run in background:

```bash
docker compose up -d
```

Stop containers:

```bash
docker compose down
```

---

## ▶️ Option 2 — Build and Run Manually

### **Build image**

```bash
docker build -t my-flask-app .
```

### **Run container**

```bash
docker run -d -p 5000:5000 my-flask-app
```

---

## ▶️ Option 3 — Using PowerShell Script

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run.ps1
```

This script:

* Builds the image
* Removes existing containers
* Runs container
* Verifies using `localhost:5000`

---

## ▶️ Option 4 — Shell Script (Linux / WSL)

```bash
bash demo_project.sh
```

---

## ✔️ Verify the App

Open in browser:

```
http://localhost:5000
```

Health check:

```
http://localhost:5000/health
```

or using curl:

```bash
curl localhost:5000
curl localhost:5000/health
```

---

## 📸 Screenshots

### Application running in browser

![Screenshot](./screenshots/localhost.png)

### Flask code in VS Code

![Screenshot](./screenshots/vscode.png)

### Docker build & run logs

![Screenshot](./screenshots/docker-logs.png)



## 📝 Requirements

`requirements.txt` includes:

```
Flask
Gunicorn
```

---

## 🎯 Summary

* Flask app runs successfully inside Docker
* Accessible at **localhost:5000**
* Docker Compose simplifies development workflow
* Works on Windows, Linux, and WSL
* Scripts automate build/run/verify steps



