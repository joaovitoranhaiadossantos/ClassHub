from flask import Flask, jsonify, request

app = Flask(__name__)

duvidas = []

@app.route("/duvidas", methods=["GET"])
def listar_duvidas():
    return jsonify(duvidas)

@app.route("/duvidas", methods=["POST"])
def adicionar_duvida():
    dados = request.json

    nova_duvida = {
        "id": len(duvidas) + 1,
        "aluno": dados.get("aluno"),
        "disciplina": dados.get("disciplina"),
        "tema": dados.get("tema"),
        "pergunta": dados.get("pergunta"),
        "status": "Pendente",
        "resposta": None,
        "link": None
    }

    duvidas.append(nova_duvida)

    return jsonify({
        "mensagem": "Dúvida cadastrada com sucesso!",
        "duvida": nova_duvida
    })

if __name__ == "__main__":
    app.run(debug=True)