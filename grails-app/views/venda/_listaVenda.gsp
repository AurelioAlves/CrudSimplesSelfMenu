<table>
    <thead>
    <th> Garçom </th>
    <th> Produto </th>
    <th colspan="2"> Opções </th>
    </thead>
    <g:each in="${vendas}" var="venda">
        <tr>
            <td>${venda.garcom.nome}</td>
            <td>${venda.produto.nome}</td>
            <td style="width: 10%" > <a href="javascript: alterarVenda(${venda.id}, ${venda.garcom.id}, ${venda.produto.id})"> Alterar </a> </td>
            <td style="width: 10%" > <a href="javascript: excluirVenda(${venda.id})"> Excluir </a> </td>
        </tr>
    </g:each>
</table>