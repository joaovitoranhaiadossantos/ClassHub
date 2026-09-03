from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/estatisticas")
def estatisticas():
    dados = {
        "Matemática": 10,
        "História": 8,
        "Biologia": 6,
        "Português": 7
    }
    return jsonify(dados)


if __name__ == "__main__":
    app.run(debug=True)