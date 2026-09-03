from flask import Flask, jsonify

app = Flask(__name__)

videos = [
    {
        "id": 1,
        "titulo": "Equação do 2º Grau",
        "disciplina": "Matemática",
        "tema": "Equações",
        "categoria": "Revisão",
        "professor": "Professor Carlos",
        "link": "https://www.youtube.com/"
    },
    {
        "id": 2,
        "titulo": "Revolução Francesa",
        "disciplina": "História",
        "tema": "Revolução Francesa",
        "categoria": "Revisão",
        "professor": "Professor Marcos",
        "link": "https://www.youtube.com/"
    }
]

@app.route("/videos")
def listar_videos():
    return jsonify(videos)

@app.route("/videos/quantidade/<disciplina>")
def quantidade_videos(disciplina):
    quantidade = 0
    for video in videos:
        if video["disciplina"].lower() == disciplina.lower():
            quantidade += 1

    return jsonify({
        "disciplina": disciplina,
        "quantidade": quantidade
    })

if __name__ == "__main__":
    app.run(debug=True)