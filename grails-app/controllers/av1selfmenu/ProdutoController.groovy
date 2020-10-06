package av1selfmenu

import grails.converters.JSON
import selfMenu.Produto

class ProdutoController extends CrudController {

    def index() { }

    def restaurar( ) { }

    def listar() {
        def produtoList = Produto.createCriteria().list {
            like("status", params.status)
            order(params.order)
        }
        if(params.status == "ATIVO") {
            render(template:"/produto/listaProduto", model:["produtos":produtoList])
        } else {
            render(template: "/produto/listaProdutoInativo", model:["produtos": produtoList])
        }
    }

    @Override
    def getEntityInstance() {
        Produto produto = new Produto()

        produto.nome = params.nome
        produto.codigo = params.codigo
        produto.preco = params.preco as Long

        return produto
    }

    @Override
    def beforeSave(def produto) {
        List<Produto> produtoList = Produto.findAllByCodigo(produto.codigo.toString())
        if( !produtoList.isEmpty() ) {
            produto.versao = produtoList*.versao.max() + 1
        }
    }

    @Override
    def afterSave(def produto) {
        List<Produto> antigo = Produto.findAllByCodigoAndStatusAndIdNotEqual( produto.codigo.toString(), "ATIVO", produto.id, [sort: 'versao', order: 'desc' ] )

        if(!antigo.isEmpty()) {
            antigo.first().status = "INATIVO"
            antigo.first().save(flush: true)
        }
    }

    def ativar() {
        def retorno = [:]
        try{
            Produto produtoAtivar = Produto.get(params.id)
            Produto produtoAtivo = Produto.findByStatusAndCodigo( "ATIVO", produtoAtivar.codigo )


            if(produtoAtivo) {
                produtoAtivo.status = "INATIVO"
                produtoAtivo.save(flush: true)
            }
            produtoAtivar.status = "ATIVO"

            produtoAtivar.save(flush: true)

            retorno.put("mensagem", "OK")
        } catch ( Exception ex ) {
            retorno.put("mensagem", "ERROR")
        }

        render retorno as JSON
    }

    def desativar() {
        def retorno = [:]
        try {
            Produto produto = Produto.get(params.id)
            produto.status = "INATIVO"

            produto.save(flush: true)
            retorno.put("mensagem", "OK")
        } catch (Exception ex) {
            retorno.put("mensagem", "ERROR")
        }

        render retorno as JSON
    }
}
