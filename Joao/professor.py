from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/professor/duvidas")
def listar_duvidas():

    duvidas = [

        {
            "id": 1,
            "aluno": "João Silva",
            "disciplina": "Matemática",
            "pergunta": "Como resolver uma equação?"
        },

        {
            "id": 2,
            "aluno": "Maria Souza",
            "disciplina": "História",
            "pergunta": "O que foi a Revolução Francesa?"
        }

    ]

    return jsonify(duvidas)


if __name__ == "__main__":
    app.run(debug=True)
