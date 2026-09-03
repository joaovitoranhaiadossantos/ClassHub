const botao = document.getElementById("carregar");
const resultado = document.getElementById("resultado");

botao.addEventListener("click", function() {
    const materiais = [
        { disciplina: "Matemática", quantidade: 10 }, 
        { disciplina: "História", quantidade: 8 }, 
        { disciplina: "Biologia", quantidade: 6 }
    ];

    resultado.innerHTML = "";