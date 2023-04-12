import click
import flask
import ssl


app = flask.Flask(__name__)


@app.route('/')
def index():
    client_ip = flask.request.environ.get('HTTP_X_REAL_IP', flask.request.remote_addr)
    return flask.jsonify({'message': app.config.get('greetings_msg', 'Greetings!'), 'client_ip': client_ip})


@click.command()
@click.option('--port', default=443, help='Server port')
@click.option('--cert', default='server.crt', help='Path to SSL certificate file')
@click.option('--key', default='server.key', help='Path to SSL key file')
@click.option('--greetings-msg', default='Greetings!', help='Greetings message')
def main(port: int, cert: str, key: str, greetings_msg: str):
    context = ssl.SSLContext(ssl.PROTOCOL_TLSv1_2)
    context.load_cert_chain(cert, key)
    app.config['greetings_msg'] = greetings_msg
    app.run(host='0.0.0.0', port=port, debug=True, ssl_context=context)


if __name__ == '__main__':
    main()
