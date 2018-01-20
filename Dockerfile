FROM westonsteimel/spark:2.2.1-alpine3.7

USER root

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# install ca-certificates so that HTTPS works consistently
# the other runtime dependencies for Python are installed later
RUN apk add --no-cache ca-certificates

RUN apk  add --no-cache python3-dev && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

#RUN apk add --no-cache --virtual .build-deps build-base && \
#    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
#    pip install -r requirements.txt
#    apk del .build-deps

ENV PYSPARK_PYTHON=python
USER spark
