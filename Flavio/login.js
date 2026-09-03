const formulario = document.getElementById("loginForm");
const mensagem = document.getElementById("mensagem");

formulario.addEventListener("submit", function(event) {

    event.preventDefault();

    const cgm = document.getElementById("cgm").value.trim();
    const nome = document.getElementById("nome").value.trim();
    const turma = document.getElementById("turma").value.trim();

    if (cgm === "" || nome === "" || turma === "") {

        mensagem.innerText = "Preencha todos os campos.";
        return;
    }

    /*
        CGMs fictícios para teste.
        Depois essa validação será feita no MySQL.
    */

    const alunos = [
        {
            cgm: "20260001",
            nome: "João Silva",
            turma: "2A"
        },
        {
            cgm: "20260002",
            nome: "Maria Souza",
            turma: "2B"
        },
        {
            cgm: "20260003",
            nome: "Pedro Santos",
            turma: "3A"
        }
    ];

    const alunoEncontrado = alunos.find(function(aluno) {

        return aluno.cgm === cgm &&
               aluno.nome.toLowerCase() === nome.toLowerCase() &&
               aluno.turma.toLowerCase() === turma.toLowerCase();

    });

    if (alunoEncontrado) {

        localStorage.setItem(
            "aluno",
            JSON.stringify(alunoEncontrado)
        );

        mensagem.innerText =
            "Acesso autorizado! Bem-vindo ao Portal de Estudos.";

        setTimeout(function() {

            window.location.href =
                "../Jeferson/principal.html";

        }, 1000);

    } else {

        mensagem.innerText =
            "Usuário não localizado. Verifique os dados informados.";
    }

});
