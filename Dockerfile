FROM odoo:18

USER root

RUN apt-get update && apt-get install -y \
    fonts-dejavu-core \
    fonts-dejavu-extra \
 && rm -rf /var/lib/apt/lists/*

USER odoo
