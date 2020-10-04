package av1selfmenu

import grails.converters.JSON
import selfMenu.Garcom

class GarcomController extends CrudController {

    def index() { }

    def listar() {
        def garcomList = Garcom.createCriteria().list {
            order("nome")
        }

        render(template:"/garcom/listaGarcom", model:["garcons": garcomList])
    }

    @Override
    def getEntityInstance() {
        Garcom garcom = null
        if(params.id) {
            garcom = Garcom.get(params.id)
        } else {
            garcom = new Garcom()
        }

        garcom.nome = params.nome

        return garcom
    }
}
