# **Gin Framework**
Gin é um framework web escrito em Go, que funciona como uma uma martini API com uma performance até 40x mais rápida graças ao httprouter.

*Antes de mais nada: Para o entendimento dessas anotações, estou partindo do pressuposto de que você já leu e entendeu tudo deste outro [tópico](https://github.com/ropehapi/caderno/Linguagens/Go/4_go_api_rest.md), como a conteinerização, o ORM etc.*
## **Instalação**
Para instalar o Gin, basta rodar esse comando no terminal:

>go get -u github.com/gin-gonic/gin

## **Servindo uma aplicação Gin**
Para subirmos uma instância de um servidor Go com Gin é muito simples:

    package main

    import (
        "github.com/gin-gonic/gin"
    )

    func main() {
        r := gin.Default()
        r.Run("8000") //Se não informado, será 8080
    }

## **O Router**
Definindo uma rota:

    func ExibeTodosAlunos(c *gin.Context){
        c.JSON(200, models.Alunos)
    }

    func main() {
        r := gin.Default()
        r.GET("/alunos", ExibeTodosAlunos)
        r.Run()
    }

### **Parâmetros nas rotas**

    r.GET("/:nome", Saudacao)

    func Saudacao(c *gin.Context){
        nome := c.Params.ByName("nome")
        c.JSON(200, gin.H{
            "API diz": "Eai, " + nome + ", tudo beleza?",
        })
    }

## **As models**

    type Aluno struct{
        gorm.Model
        Nome string `json:"nome"`
        CPF string `json:"cpf"`
        RG string `json:"rg"`

    }

    var Alunos []Aluno

## **Migrando os dados com o gORM**
Podemos fazer com que a estrutura do nosso banco seja definida logo após a obtenção de uma instância da sua conexão, como uma migration. Basta adicionar a uma model a propriedade `gorm.Model`, que adiciona alguns atributos à model, como o id, e alguns timestamps.

    Na função de conexão com o banco, após obter a conexão com sucesso:

    DB.AutoMigrate(&models.Aluno{})

## **Criando um registro**
No gin, podemos criar um registro através de uma model de maneira muito simples, basta informar o endereço de memória da model ao método `c.ShouldBindJson()` do Gin que ele se encarrega de relacionar o json da request com os atributos da model.

    func CriaNovoAluno(c *gin.Context){
        var aluno models.Aluno
        if err := c.ShouldBindJson(&aluno); err != nil{
            c.JSON(http.StatusBadRequest, gin.H{
                "error": err.Error()})
            return
        }
        database.DB.Create(&aluno)
        c.JSON(http.StatusOK, aluno)
    }