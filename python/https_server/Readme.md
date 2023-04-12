# Flask HTTPS Server

This is a simple Flask server that communicates over HTTPS and returns a JSON payload containing a greeting message and the client's IP address.

## Usage

```shell
pip install poetry
poetry lock
poetry run https-server --port <port> --cert <crt_file> --key <key_file> --greetings-msg <message>
```

