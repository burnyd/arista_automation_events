#docker run --rm -it -v /$(pwd):/nornir nornir gather_facts.py --host ussclpdnwsaac37

FROM python:3.6
RUN set -x && \
    pip install nornir \
    python-dotenv \
    tqdm
WORKDIR /nornir
COPY . /nornir
VOLUME /nornir
ENTRYPOINT [ "/usr/local/bin/python" ]

