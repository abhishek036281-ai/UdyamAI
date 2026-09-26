FROM python:3.11-slim

WORKDIR /app

# Install dependencies first (caching layer)
COPY backend/requirements.txt /app/backend/
RUN pip install --no-cache-dir -r backend/requirements.txt

# Copy the entire project
COPY . /app/

# Expose the Render port
EXPOSE 8000

# Run the application
# We need to run it from the backend folder to maintain python module resolution
CMD cd backend && uvicorn app.main:app --host 0.0.0.0 --port $PORT
