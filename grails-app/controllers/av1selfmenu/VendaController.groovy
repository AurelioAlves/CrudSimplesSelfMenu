package av1selfmenu

import grails.converters.JSON
import selfMenu.Garcom
import selfMenu.Produto
import selfMenu.Venda

class VendaController extends CrudController {

    def index() {
    }

    def listar() {
        def query = {
            order("garcom")
        }

        def vendaList = Venda.createCriteria().list{query }

        render(template:"/venda/listaVenda", model:["vendas":vendaList])
    }

    @Override
    def getEntityInstance() {
        Venda venda = null
        if(params.id) {
            venda = Venda.get(params.id)
        } else {
            venda = new Venda()
        }

        venda.garcom = Garcom.get(params.garcom)
        venda.produto = Produto.get(params.produto)

        return venda
    }
}
