<!DOCTYPE html>

<html>
    <head>
        <meta name="layout" content="main" />
        <title>Produto</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="${resource(dir:'js', file:'garcom_scripts.js')}"></script>
        <style>

        </style>
    </head>
    <body>
        <div  id="divGarcom">
            <div id="formGarcom">
                <div id="divMensagemGarcom" ></div>
                <g:formRemote id="formGarcom" name="formGarcom" url="[controller: 'garcom', action: 'salvar']" onSuccess="retornoSalvarGarcom(data)">
                    Nome do Garçom: <input style="" type="text" name="nome" value="" />
                                    <input style="" type="hidden" name="id" value="" />
                    <input type="submit" name="salvar" value="Salvar" />
                </g:formRemote>
            </div>
        </div>
        <div id="divListarGarcom" />
    </body>
</html>