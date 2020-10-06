package av1selfmenu

import grails.converters.JSON

class CrudController {

    def getEntityInstance() { }

    def beforeSave( def entityInstance) { }

    def beforeDelete( def entityInstance ) { }

    def afterSave(def entityInstance) { }

    def afterDelete( def entityInstance ) { }

    def salvar() {
        def retorno = [:]
        def entityInstance = getEntityInstance()

        beforeSave( entityInstance )

        entityInstance.validate()
        if(!entityInstance.hasErrors()) {
            entityInstance.save(flush: true, failOnError: true)
            retorno["mensagem"] = "OK"
        } else {
            retorno['mensagem'] = "ERROR"
        }

        afterSave(entityInstance)

        render retorno as JSON
    }

    def excluir() {
        def retorno = [:]
        def entityInstance = getEntityInstance()

        beforeDelete( entityInstance )

        try {
            entityInstance.delete(flush: true)
            retorno["mensagem"] = "OK"
        } catch( Exception ex ) {
            retorno["mensagem"] = "ERROR"
        }

        afterDelete( entityInstance )

        render retorno as JSON
    }

    def buscar() {
        def retorno = [:]
        def entityInstance = getEntityInstance()
        retorno["entity"] = entityInstance

        render retorno as JSON
    }

    def editar() {
        salvar()
    }


}
