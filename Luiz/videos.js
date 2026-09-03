const listaVideos = document.getElementById("listaVideos");
const pesquisa = document.getElementById("pesquisa");
const disciplina = document.getElementById("disciplina");

const videos = [
    {
        titulo: "Operações com ângulos",
        disciplina: "Matemática",
        tema: "Operações com ângulos",
        categoria: "Revisão",
        professor: "Professora Gis com Giz",
        link: "https://youtu.be/ChrWd9fNtnI?si=M9ViBXkC-X5HvVk2"
    },
    {
        titulo: "Revolução Francesa",
        disciplina: "História",
        tema: "Revolução Francesa",
        categoria: "Revisão",
        professor: "Professor Débora Aladim",
        link: "https://youtu.be/ceCcZooYDBo?si=8RdKnx_ygOWnQuPx"
    },
    {
        titulo: "Mitocôndria",
        disciplina: "Biologia",
        tema: "Célula",
        categoria: "Aula",
        professor: "Professor Samuel Cunha",
        link: "https://youtu.be/xx0nByfP4SU?si=4LgRVUpbPxMmBZCS"
    },
    {
        titulo: "Interpretação de texto",
        disciplina: "Português",
        tema: "Interpretação",
        categoria: "Exercícios",
        professor: "Professora Pamba",
        link: "https://youtu.be/W3XrpIRTgzA?si=LnEUnEsoxH5mw8ir"
    }
];

function mostrarVideos() {
    const texto = pesquisa.value.toLowerCase();
    const materia = disciplina.value;

    const resultados = videos.filter(function(video) {
        const correspondePesquisa =
            video.titulo.toLowerCase().includes(texto) ||
            video.tema.toLowerCase().includes(texto);

        const correspondeDisciplina =
            materia === "" ||
            video.disciplina === materia;

        return correspondePesquisa && correspondeDisciplina;
    });

    listaVideos.innerHTML = "";

    if (resultados.length === 0) {
        listaVideos.innerHTML = "<p>Nenhum conteúdo encontrado.</p>";
        return;
    }

    resultados.forEach(function(video) {
        const div = document.createElement("div");
        div.classList.add("video");
        div.innerHTML = `
            <h2>${video.titulo}</h2>
            <p><strong>Disciplina:</strong> ${video.disciplina}</p>
            <p><strong>Tema:</strong> ${video.tema}</p>
            <p><strong>Categoria:</strong> ${video.categoria}</p>
            <p><strong>Professor:</strong> ${video.professor}</p>
            <a href="${video.link}" target="_blank">▶ Assistir vídeo</a>
        `;
        listaVideos.appendChild(div);
    });
}

pesquisa.addEventListener("input", mostrarVideos);
disciplina.addEventListener("change", mostrarVideos);

function voltar() {
    window.location.href = "../Jeferson/principal.html";
}

mostrarVideos();