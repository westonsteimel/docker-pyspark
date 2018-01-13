FROM westonsteimel/spark:2.2.1-alpine3.7

USER root

ARG PYTHON_VERSION=3.6.3-r9
RUN apk --no-cache add python3=${PYTHON_VERSION} && \
    rm -rf /var/cache/apk/*
ENV PYSPARK_PYTHON=python3
USER spark
