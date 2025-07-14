FROM ubuntu: latest

# Install Python, pip and git
RUN apt-get update && \
    apt-get install -y python3.10 python3-pip git

# Make python3 → python, install PyYAML
RUN update-alternatives --install /usr/bin/python3 python /usr/bin/python3.10 1 && \
    pip3 install --no-cache-dir pyyaml

# Copy your generator and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# 4) Ensure they’re executable
RUN chmod +x /usr/bin/feed.py /entrypoint.sh

# 5) Run the entrypoint when container starts
ENTRYPOINT ["/entrypoint.sh"]
