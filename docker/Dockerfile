FROM python:3.7-buster


RUN apt-get update
RUN apt-get install --no-install-recommends -y \
                    aria2 \
                    # postgresql \
                    # postgresql-contrib \
                    postgresql-client-11 \
                    postgresql-client-common \
                    locales && \
    apt-get clean

# Configure locale (needed to run tests)
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN echo 'pt_BR.UTF-8 UTF-8' >> /etc/locale.gen
RUN /usr/sbin/locale-gen


RUN pip install rows[cli]
RUN pip install rows[postgresql]
RUN pip install -U https://github.com/turicas/rows/archive/develop.zip

COPY . /app

RUN pip install --no-cache-dir -U pip \
  && pip install --no-cache-dir -r /app/requirements.txt

WORKDIR  /app
