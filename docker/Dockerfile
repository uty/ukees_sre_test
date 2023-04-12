# syntax=docker/dockerfile:1
FROM ubuntu:18.04 AS compile-step
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential

WORKDIR /tmp
COPY hello.c .
RUN gcc -shared -o libhello.so -fPIC hello.c

FROM python:3.9-slim-buster

WORKDIR /app
COPY --from=compile-step /tmp/libhello.so .
COPY hello.py .

CMD ["python3", "hello.py"]
