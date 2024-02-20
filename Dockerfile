FROM GX 1.0.0

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

CMD ["GX", "main.gx"]
