<table>
    <thead>
    <th> Nome </th>
    <th> Preço </th>
    <th> Codigo </th>
    <th> Versao </th>
    <th colspan="2">Opções</th>
    </thead>
    <g:each in="${produtos}" var="produto">
        <tr>
            <td>${produto.nome}</td>
            <td>${produto.preco}</td>
            <td>${produto.codigo}</td>
            <td>${produto.versao}</td>
            <td style="width: 10%" > <a href="javascript: alterarProduto(${produto.id}, '${produto.nome}', '${produto.preco}' )"> Alterar </a> </td>
            <td style="width: 10%" > <a href="javascript: desativarProduto(${produto.id})"> Inativar </a> </td>
        </tr>
    </g:each>
</table>