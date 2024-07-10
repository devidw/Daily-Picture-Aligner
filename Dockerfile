FROM python:3.11-bookworm

WORKDIR /opt/my-app

COPY . .

RUN apt-get update && \
    apt-get install -y ffmpeg unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash", "./go.sh"]
