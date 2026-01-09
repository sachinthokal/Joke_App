# =============================
# AKS-Compatible Python Dockerfile
# =============================

# 1️⃣ Use explicit AMD64 base image
FROM --platform=linux/amd64 python:3.12-slim

# 2️⃣ Set working directory
WORKDIR /app

# 3️⃣ Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4️⃣ Copy application code
COPY . .

# 5️⃣ Expose port (optional, for AKS Service)
EXPOSE 5000

# 6️⃣ Run the app with Gunicorn
# Replace `app:app` with your Python module and Flask/FastAPI app object
CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app", "--workers", "2"]
