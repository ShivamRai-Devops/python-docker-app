# Stage 1: Build stage
FROM python:3.9-slim as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Stage 2: Final stage
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5000

CMD ["python", "app.py"]
