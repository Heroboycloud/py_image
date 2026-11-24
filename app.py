import os
from bottle import route, run

@route('/')
def index():
    return "<h1>Hello from Bottle on Alpine!</h1>"

@route('/health')
def health():
    return {"status": "ok"}

if __name__ == '__main__':
    host = os.environ.get('BOTTLE_HOST', '0.0.0.0')
    port = int(os.environ.get('BOTTLE_PORT', 5444))
    run(host=host, port=port, server='wsgiref')
