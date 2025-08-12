FROM odoo:18.0

USER root

COPY requirements.txt /tmp/

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libssl-dev \
    swig \
    libffi-dev \
    git \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --break-system-packages -r /tmp/requirements.txt

USER odoo