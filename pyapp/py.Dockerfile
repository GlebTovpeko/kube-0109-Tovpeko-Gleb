FROM python:3.9.25-alpine3.22

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]