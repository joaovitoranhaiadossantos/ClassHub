from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# CONFIGURAÇÃO DO MYSQL DO XAMPP
# Estrutura: mysql+pymysql://usuario:senha@localhost/nome_do_banco
# O padrão do XAMPP é usuário 'root' e sem senha ('')
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/portal_estudos'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Define a estrutura da tabela no MySQL
class Duvida(db.Model):
    __tablename__ = 'duvidas' # Nome da tabela no MySQL
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    aluno = db.Column(db.String(100), nullable=False)
    disciplina = db.Column(db.String(100), nullable=False)
    tema = db.Column(db.String(100), nullable=False)
    pergunta = db.Column(db.Text, nullable=False)
    status = db.Column(db.String(20), default="Pendente")
    resposta = db.Column(db.Text, nullable=True)
    link = db.Column(db.String(255), nullable=True)

    def to_dict(self):
        return {
            "id": self.id,
            "aluno": self.aluno,
            "disciplina": self.disciplina,
            "tema": self.tema,
            "pergunta": self.pergunta,
            "status": self.status,
            "resposta": self.resposta,
            "link": self.link
        }

@app.route("/duvidas", methods=["GET"])
def listar_duvidas():
    todas_duvidas = Duvida.query.all()
    return jsonify([duvida.to_dict() for duvida in todas_duvidas])

@app.route("/duvidas", methods=["POST"])
def adicionar_duvida():
    dados = request.json

    nova_duvida = Duvida(
        aluno=dados.get("aluno"),
        disciplina=dados.get("disciplina"),
        tema=dados.get("tema"),
        pergunta=dados.get("pergunta")
    )

    db.session.add(nova_duvida)
    db.session.commit()

    return jsonify({
        "mensagem": "Dúvida cadastrada no MySQL com sucesso!",
        "duvida": nova_duvida.to_dict()
    }), 201

if __name__ == "__main__":
    with app.app_context():
        db.create_all() # Cria a tabela dentro do seu banco automaticamente
        
    app.run(debug=True)
