FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        iputils-ping \
        procps \
        util-linux \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/ .

RUN chmod +x diagnostic.sh health-check.sh

ENTRYPOINT ["/app/diagnostic.sh"]

