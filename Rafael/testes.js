function executarTestes() {
    const resultado =
        document.getElementById("resultado");

    resultado.innerHTML = "";

    const testes = [
        {
            nome: "Teste de login",
            resultado: "OK"
        },
        {
            nome: "Teste de pesquisa",
            resultado: "OK"
        },
        {
            nome: "Teste de filtro",
            resultado: "OK"
        },
        {
            nome: "Teste de envio de dúvida",
            resultado: "OK"
        },
        {
            nome: "Teste de resposta do professor",
            resultado: "OK"
        }
    ];


    testes.forEach(function(teste) {
        const div =
            document.createElement("div");
        div.classList.add("teste");
        div.innerHTML = `
            <strong>
                ${teste.nome}
            </strong>
            — ${teste.resultado}
        `;
        resultado.appendChild(div);

    });

}
