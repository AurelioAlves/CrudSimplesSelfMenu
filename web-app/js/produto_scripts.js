$(document).ready( function() {
    carregarListaProduto()
});

function carregarListaProduto() {
    let data = { status: "ATIVO", order: "nome" };
    if(document.documentURI.includes("restaurar")){
        data = { status: "INATIVO", order: "versao" }
    }
    $.ajax( {
        method: "POST",
        url: "listar",
        data: data,
        success: function( data ) {
            console.log(data)
            $("#divListarProduto").html( data )
        }
    })
}

function retornoSalvarProduto( data ) {
    if(data.mensagem == "OK") {
        $("#divMensagemProduto").html("Banda Salva com Sucesso");
        $("#formProduto input[name=nome]").val("");
        $("#formProduto input[name=preco]").val("");
        $("#formProduto input[name=id]").val("");
        carregarListaProduto()
    } else {
        $("#divMensagemProduto")
    }
}

function excluirProduto( id ) {
    if(confirm("Deseja realmente excluir esse produto ?")) {
        $.ajax( {
            method: "POST",
            url: "excluir",
            data: {"id": id},
            success: function( data ) {
                if(data.mensagem == "OK") {
                    carregarListaProduto()
                } else {
                    $("#divMensagemProduto").html("Não foi possível excluir")
                }
            }
        })
    }
}

function alterarProduto( id, nome, preco ) {
    $.ajax({
        method:"POST",
        url: "buscar",
        data: {"id": id, "nome": nome, "preco": preco},
        success: function( data ) {
            console.log(data);
            $("#formProduto input[name=nome]").val(data.entity.nome);
            $("#formProduto input[name=id]").val(data.entity.id);
            $("#formProduto input[name=preco]").val(data.entity.preco);
        }
    })
}

function ativarProduto() {

}

function desativarProduto() {
    
}