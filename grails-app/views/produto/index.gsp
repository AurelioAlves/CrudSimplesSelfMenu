<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Produto</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="${resource(dir:'js', file:'produto_scripts.js')}"></script>
        <style>
            label {
                padding: 5px;
            }
            input {
                display: flex;
                padding-left: 10px;
            }
            .salvar {
                margin: 5px;
                padding: 5px;
                float: right;
            }
        </style>
    </head>
    <body>
    <div id="divProdutos">
        <a href="restaurar.gsp"> Restaurar </a>
        <div id="formProduto">
            <div id="divMensagemProduto"></div>
            <g:formRemote id="formProduto" name="formProduto" url="[controller: 'produto', action:'salvar']" onSuccess="retornoSalvarProduto(data)">
                <label for="nome">
                    Nome do Produto:
                    <input id="nome" style="" type="text" name="nome" value=""/>
                    <input type="hidden" name="id" value="" />
                </label>
                <label for="preco">
                    Preço do Produto:
                    <input id="preco" style="" type="text" name="preco" value=""/>
                </label>
                <label for="codigo">
                    Codigo do Produto:
                    <input id="codigo" style="" type="text" name="codigo" value=""/>
                </label>
                <input class="salvar" type="submit" name="salvar" value="Salvar" />
            </g:formRemote>

            </div>
        </div>
        <div id="divListarProduto" />
    </body>

</html>