
const lista = document.getElementById("listaDuvidas");


let duvidas = [

    {
        id: 1,
        aluno: "João Silva",
        disciplina: "Matemática",
        pergunta: "Como resolver uma equação do segundo grau?"
    },

    {
        id: 2,
        aluno: "Maria Souza",
        disciplina: "História",
        pergunta: "O que causou a Revolução Francesa?"
    },

    {
        id: 3,
        aluno: "Pedro Santos",
        disciplina: "Biologia",
        pergunta: "Qual a função da mitocôndria?"
    }

];


function mostrarDuvidas() {

    lista.innerHTML = "";

    duvidas.forEach(function(duvida) {

        const div = document.createElement("div");

        div.classList.add("duvida");

        div.innerHTML = `

            <h3>${duvida.disciplina}</h3>

            <p>
                <strong>Aluno:</strong>
                ${duvida.aluno}
            </p>

            <p>
                <strong>Dúvida:</strong>
                ${duvida.pergunta}
            </p>

            <label>
                Link do vídeo no YouTube:
            </label>

            <input
                type="text"
                id="link-${duvida.id}"
                placeholder="Cole o link aqui"
            >

            <button
                onclick="responder(${duvida.id})">
                Responder
            </button>

        `;

        lista.appendChild(div);

    });

}


function responder(id) {

    const input =
        document.getElementById("link-" + id);

    const link = input.value.trim();


    if (link === "") {

        alert("Digite o link do vídeo.");

        return;
    }


    if (!link.includes("youtube.com") &&
        !link.includes("youtu.be")) {

        alert("Digite um link válido do YouTube.");

        return;
    }


    alert("Resposta enviada com sucesso!");

    input.value = "";

}


function voltar() {

    window.location.href =
        "../Jeferson/principal.html";

}


mostrarDuvidas();



