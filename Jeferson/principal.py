from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/principal")
def principal():

    return jsonify({
        "sistema": "Portal de Estudos",
        "status": "online",
        "mensagem": "Bem-vindo ao Portal de Estudos!"
    })


if __name__ == "__main__":
    app.run(debug=True)
