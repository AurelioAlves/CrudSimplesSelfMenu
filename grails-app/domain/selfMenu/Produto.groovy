package selfMenu

class Produto {
    String nome
    String codigo
    Long preco
    int versao = 0
    String status = "ATIVO"


    static constraints = {
        codigo( unique: ['codigo', 'versao'] )
        status inList:["ATIVO","INATIVO"]
    }
}
