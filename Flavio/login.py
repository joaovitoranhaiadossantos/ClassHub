from flask import Flask, jsonify, request

app = Flask(__name__)


alunos = [
    {
        "cgm": "20260001",
        "nome": "João Silva",
        "turma": "2A"
    },
    {
        "cgm": "20260002",
        "nome": "Maria Souza",
        "turma": "2B"
    },
    {
        "cgm": "20260003",
        "nome": "Pedro Santos",
        "turma": "3A"
    }
]


@app.route("/login", methods=["POST"])
def login():

    dados = request.json

    cgm = dados.get("cgm")
    nome = dados.get("nome")
    turma = dados.get("turma")

    for aluno in alunos:

        if (
            aluno["cgm"] == cgm
            and aluno["nome"].lower() == nome.lower()
            and aluno["turma"].lower() == turma.lower()
        ):

            return jsonify({
                "sucesso": True,
                "mensagem": "Acesso autorizado!",
                "aluno": aluno
            })

    return jsonify({
        "sucesso": False,
        "mensagem": "Usuário não localizado."
    })


if __name__ == "__main__":
    app.run(debug=True)
