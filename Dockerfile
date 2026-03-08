# 1. Grab a tiny, pre-configured Linux OS that already has Python 3.12 installed
FROM python:3.12-slim

# 2. Create a working directory INSIDE the container
WORKDIR /app

# 3. Copy your requirements file from your laptop into the container
COPY requirements.txt .

# 4. Install the dependencies INSIDE the container (no venv needed here!)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your actual application code into the container
COPY . .

# 6. The default command to run when the container turns on
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:8000", "app.main:app"]
