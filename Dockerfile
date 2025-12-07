# Use an official lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependency file first for caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Expose the port Flask will run on
EXPOSE 5000

# Environment variable to prevent Python buffering logs (nice for Docker logs)
ENV PYTHONUNBUFFERED=1

# Start the Flask app
# Run with gunicorn for production
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app", "--workers", "2"]
