FROM python:3.11

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    node-less \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    build-essential \
    libssl-dev \
    python3-dev \
    libjpeg-dev \
    liblcms2-dev \
    libblas-dev \
    libatlas-base-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the Odoo source code
COPY ./odoo /odoo
WORKDIR /odoo

# Install Python dependencies
RUN pip install -r requirements.txt

# Port for the server
EXPOSE 8069

# Default command
CMD ["python3", "odoo-bin", "-d", "odoo", "--db_user=odoo", "--db_password=odoo", "--config=/etc/odoo/odoo.conf"]
