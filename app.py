from flask import Flask

app = Flask (__name__)

@app.route("/")
def inicio():
    
    return """
    <h1>Portal de Estudos</h1>
    <p>Sistema funcionando!</p>
    <a href="/login">
    Entrar
    </a>
    """
@app.route("/login")
def login():
    
    return """
    <h1>Login</h1>
    
    <p>Página de login do Portal de Estudos.</p>
    """
    
if __name__ == "__main__":
    app.run(
        debug=True
    )