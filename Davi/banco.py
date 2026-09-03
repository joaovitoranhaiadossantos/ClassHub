import mysql.connector


def conectar():
    conexao = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="portal_estudos"
    )

    return conexao


def testar_conexao():
    try:
        conexao = conectar()

        if conexao.is_connected():
            print("Banco de dados conectado com sucesso!")

        conexao.close()

    except mysql.connector.Error as erro:
        print("Erro ao conectar ao banco:", erro)


if __name__ == "__main__":
    testar_conexao()
