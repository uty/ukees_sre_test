# Python App Compiled Library

A Docker image for a Python app that uses a C library. The C library is compiled from source, and the Python app accesses the compiled library to run a function from it.

## Usage
```bash
docker build . -t test-python-and-c-lib
docker run test-python-and-c-lib
```