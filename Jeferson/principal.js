const alunoSalvo = localStorage.getItem("aluno");

const nomeAluno = document.getElementById("nomeAluno");
const turmaAluno = document.getElementById("turmaAluno");

if (alunoSalvo) {

    const aluno = JSON.parse(alunoSalvo);

    nomeAluno.innerText = "Olá, " + aluno.nome + "! 👋";

    turmaAluno.innerText =
        "Turma: " + aluno.turma +
        " | CGM: " + aluno.cgm;

} else {

    nomeAluno.innerText = "Olá, estudante!";

}


function abrirVideos() {

    window.location.href =
        "../Luiz/videos.html";

}


function abrirDuvidas() {

    window.location.href =
        "../Nathan/duvidas.html";

}


function abrirProfessores() {

    window.location.href =
        "../Joao/professor.html";

}


document.getElementById("sair")
    .addEventListener("click", function() {

        localStorage.removeItem("aluno");

        window.location.href =
            "../Flavio/login.html";

    });
