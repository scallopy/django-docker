# Pull base image
FROM python:3

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /app

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN python3 -m pip install -r requirements.txt

# Copy project
COPY . /app/


