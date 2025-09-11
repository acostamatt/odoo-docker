FROM python:3.11

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
    wget \
    node-less \
    libpq-dev \
    libsasl2-dev \
    libldap2-dev \
    libjpeg-dev \
    liblcms2-dev \
    libblas-dev \
    liblapack-dev \
    libopenblas-dev \
    postgresql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./app /odoo
WORKDIR /odoo

RUN pip install --no-cache-dir --break-system-packages -r /odoo/requirements.txt
RUN pip install --no-cache-dir --break-system-packages -r /tmp/requirements.txt

EXPOSE 8069 8072