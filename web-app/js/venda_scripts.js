$(document).ready( function() {
  carregarListaVenda();
});

function carregarListaVenda() {
    $.ajax( {
        method: "POST",
        url: "listar",
        data: { },
        success: function( data ) {
            $("#divListarVenda").html( data )
        }
    })
}

function retornoSalvarVenda( data ) {
    if(data.mensagem == "OK") {
        $("#divMensagemVenda").html("Venda Salva com Sucesso");
        $("#formVenda select[name=garcom]").val("");
        $("#formVenda select[name=produto]").val("");
        carregarListaVenda()
    } else {
        $("#divMensagemVenda").html("Não foi possivel salvar a Venda")
    }
}

function excluirVenda( id ) {
    if(confirm("Deseja realmente excluir essa Venda ?")) {
        $.ajax( {
            method: "POST",
            url: "excluir",
            data: {"id": id},
            success: function( data ) {
                if(data.mensagem == "OK") {
                    carregarListaVenda()
                } else {
                    $("#divMensagemProduto").html("Não foi possível excluir")
                }
            }
        })
    }
}

function alterarVenda( id, garcom, produto) {
    $.ajax({
        method:"POST",
        url: "buscar",
        data: {"id": id, "garcom": garcom, "produto":produto},
        success: function( data ) {
            $("#formVenda select[name=garcom]").val(data.entity.garcom.id);
            $("#formVenda input[name=id]").val(data.entity.id);
            $("#formVenda select[name=produto]").val(data.entity.produto.id);
        }
    })
}