<table>
    <thead>
    <th> Nome </th>
    <th> Preço </th>
    <th> Versao </th>
    <th colspan="3">Opções</th>
    </thead>
    <g:each in="${produtos}" var="produto">
        <tr>
            <td>${produto.nome}</td>
            <td>${produto.preco}</td>
            <td>${produto.versao}</td>
            <td style="width: 10%" > <a href="javascript: alterarProduto(${produto.id}, '${produto.nome}', '${produto.preco}' )"> Alterar </a> </td>
            <td style="width: 10%" > <a href="javascript: excluirProduto(${produto.id})"> Inativar </a> </td>
            <td style="width: 10%" > <a href="restaurar.gsp"> Restaurar </a> </td>
        </tr>
    </g:each>
</table>