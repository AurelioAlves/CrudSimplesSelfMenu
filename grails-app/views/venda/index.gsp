<%@ page import="selfMenu.Produto; selfMenu.Garcom" %>
<!DOCTYPE html>

<html>
    <head>
        <meta name="layout" content="main" />
        <title>Produto</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="${resource(dir:'js', file:'venda_scripts.js')}"></script>
        <style>

        </style>
    </head>

    <body>
        <div id="divVenda">
            <div id="formVenda">
                <div id="divMensagemVenda"></div>
                <g:formRemote id="formVenda" name="formVenda" url="[controller: 'venda', action: 'salvar']" onSuccess="retornoSalvarVenda(data)">
                    Garçom: <g:select optionKey="id" from="${Garcom.list()}" optionValue="${{it.nome}}" name="garcom"/>
                    <input type="hidden" name="id" value="" />
                    Produto: <g:select optionKey="id" from="${Produto.list()}" optionValue="${{it.nome}}" name="produto"/>
                    <input type="submit" name="salvar" value="Salvar" />
                </g:formRemote>
            </div>
        </div>
    <div id="divListarVenda" />
    </body>
</html>