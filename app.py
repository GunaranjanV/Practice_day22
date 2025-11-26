FROM flask import flask

app = Flask(_name_)
@app.route('/')
def hello():
    retun "hello guys this is our first flash app"
    if _name_ = '_main_':
        app.run(host='0.0.0.0', port=55005)