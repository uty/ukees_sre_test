# syntax=docker/dockerfile:1
FROM ubuntu:18.04 AS compile-step
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential

WORKDIR /tmp
COPY hello.c .
RUN gcc -o helloworld hello.c

FROM python:3.8-slim-buster

COPY --from=compile-step /tmp/hellowolrd .

CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]
