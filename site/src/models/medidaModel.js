var database = require("../database/config");

function buscarUltimasMedidas(limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select personagem.nome, count(voto.idVoto) from personagem join voto on fkPersonagem = idpersonagem group by personagem.nome;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select personagem.nome as personagem, count(voto.idVoto) as votos from personagem join voto on fkPersonagem = idpersonagem group by personagem.nome;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal() {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select personagem.nome as personagem, count(voto.idVoto) as votos from personagem join voto on fkPersonagem = idpersonagem group by personagem.nome;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select personagem.nome, count(voto.idVoto) from personagem join voto on fkPersonagem = idpersonagem group by personagem.nome;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
