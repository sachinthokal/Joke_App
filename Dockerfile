FROM python:3.12

WORKDIR /app

COPY requirements.txt .

# Force gunicorn reinstall
RUN pip uninstall -y gunicorn || true \
 && pip install --no-cache-dir gunicorn \
 && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "-m", "gunicorn", "-b", "0.0.0.0:5000", "main:app"]
