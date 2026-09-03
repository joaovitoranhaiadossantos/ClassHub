const disciplina = document.getElementById("disciplina");
const tema = document.getElementById("tema");
const pergunta = document.getElementById("pergunta");
const enviar = document.getElementById("enviar");
const lista = document.getElementById("listaDuvidas");

let duvidas = [];

enviar.addEventListener("click", function() {
    if (
        disciplina.value === "" ||
        tema.value.trim() === "" ||
        pergunta.value.trim() === ""
    ) {
        alert("Preencha todos os campos.");
        return;
    }

    const novaDuvida = {
        id: Date.now(),
        disciplina: disciplina.value,
        tema: tema.value,
        pergunta: pergunta.value,
        status: "Pendente",
        resposta: null,
        link: null
    };

    duvidas.push(novaDuvida);

    disciplina.value = "";
    tema.value = "";
    pergunta.value = "";

    mostrarDuvidas();
    alert("Dúvida enviada com sucesso!");
});

function mostrarDuvidas() {
    lista.innerHTML = "";

    duvidas.forEach(function(duvida) {
        const div = document.createElement("div");
        div.classList.add("duvida");

        div.innerHTML = `
            <h3>${duvida.disciplina}</h3>
            <p><strong>Tema:</strong> ${duvida.tema}</p>
            <p><strong>Dúvida:</strong> ${duvida.pergunta}</p>
            <p><strong>Status:</strong> ${duvida.status}</p>
        `;

        if (duvida.link) {
            div.innerHTML += `
                <a href="${duvida.link}" target="_blank">
                    ▶ Ver resposta
                </a>
            `;
        }

        lista.appendChild(div);
    });
}

function voltar() {
    window.location.href = "../Jeferson/principal.html";
}