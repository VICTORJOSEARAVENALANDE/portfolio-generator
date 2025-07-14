FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3.10 python3-pip git && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python /usr/bin/python3.10 1 && \
    pip3 install --no-cache-dir pyyaml

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /usr/bin/feed.py /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
