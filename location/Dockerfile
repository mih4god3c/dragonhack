FROM python:latest

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

ENV IP_2_LOCATION_TOKEN="EEfBjVuDMq3DQ7171VTQwgGHs92SIzaqyNfXXkUdxIdQ1lWIGQQxvPAASO9GfvsX"

RUN python ip2location/download.py

EXPOSE 8080

CMD ["python", "app.py"]
