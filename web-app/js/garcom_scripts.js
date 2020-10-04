$(document).ready( function() {
   carregarListaGarcom()
});

function carregarListaGarcom() {
    $.ajax({
        method: "POST",
        url: "listar",
        data: { },
        success: function( data ) {
            $("#divListarGarcom").html( data )
        }
    })
}

function retornoSalvarGarcom( data ) {
    if(data.mensagem == "OK") {
        $("#divMensagemGarcom").html("Garçom Salvo com Sucesso")
        $("#formGarcom input[name=nome]").val("");
        carregarListaGarcom()
    } else {
        $("#divMensagemGarcom")
    }
}

function excluirGarcom( id ) {
    if(confirm("Deseja realmente excluir esse registro ?")) {
        $.ajax( {
            method: "POST",
            url: "excluir",
            data: {"id": id},
            success: function( data ) {
                if(data.mensagem == "OK") {
                    carregarListaGarcom()
                } else {
                    $("#divMensagemGarcom").html("Não foi possível excluir")
                }
            }
        })
    }
}

function alterarGarcom( id, nome ) {
    $.ajax({
        method:"POST",
        url: "buscar",
        data: {"id": id, "nome": nome},
        success: function( data ) {
            $("#formGarcom input[name = nome]").val(data.entity.nome);
            $("#formGarcom input[name = id]").val(data.entity.id);
        }
    })
}