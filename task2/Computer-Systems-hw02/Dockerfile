# Use Python 3.10 as base
FROM python:3.10

# Set work directory inside container
WORKDIR /app

# Copy project files into container
COPY . .

# Install required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose port for FastAPI
EXPOSE 8000

# Command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]