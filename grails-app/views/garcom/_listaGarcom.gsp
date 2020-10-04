<table>
    <thead>
    <th> Nome </th>
    <th> Quantidade de Vendas </th>
    <th colspan="2">Opções</th>
    </thead>
    <g:each in="${garcons}" var="garcom">
        <tr>
            <td> ${garcom.nome} </td>
            <td> ${garcom.qtdVendas} </td>
            <td style="width: 10%" > <a href="javascript: alterarGarcom(${garcom.id}, '${garcom.nome}')"> Alterar </a> </td>
            <td style="width: 10%"> <a href="javascript: excluirGarcom(${garcom.id})">Excluir</a></td>
        </tr>
    </g:each>
</table>