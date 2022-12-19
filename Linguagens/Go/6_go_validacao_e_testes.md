# **Testes e validações com Go**
## **Validações**
Para que possamos validar a integridade dos dados em go, usamos o pacote `validator v2`, que pode ser instalado através do comando:

> go get gopkg.in/validator.v2

Para validarmos a integridade dos dados de entrada em uma struct por exemplo, podemos faze-la da seguinte maneira

    type NewUserRequest struct {
        Username string `validate:"min=3,max=40,regexp=^[a-zA-Z]*$"`
        Name string     `validate:"nonzero"`
        Age int         `validate:"min=21"`
        Password string `validate:"min=8"`
    }

Com os tipos de validações definidos, podemos criar um método validate daquela struct, que deve ser utilizada nas controllers onde queremos fazer nossas implementações.
    
    Na model:
    func Validate(aluno *Aluno) error {
        if err := validator.Validate(aluno); err != nil {
            return err
        }
        return nil
    }

    Na controller:
    if err := models.Validate(&aluno); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error()})
		return
	}

## **Testes unitários**
*Antes de mais nada: Por se tratar de um repositório de estudos sobre Go, vou me abster de explicar a teoria por trás dos testes unitários.*

### **Os testes**
Testes unitários em Golang devem ser executados através de um comando, que rodará todos os testes descritos em um arquivo `main_test.go`, afim de testar a integridade de nosso código. Para isso, basta rodar o comando:

> go test

Para que possamos escrever nossos testes nesse arquivo, será necessário importar o pacote `testify`, através do seguinte comando:

> go get github.com/stretchr/testify

### **Escrevendo os testes**
Para que tenhamos um arquivo de testes fluído e que rode com clareza, devemos escrever nossos testes da forma mais fiel possível à execução do nosso código em um caso real, portanto, trazendo um exemplo das aplicações desenvolvidas em anotações anteriores, faremos com que nosso `main_test.go` disponha de algumas ferramentas, como uma função que faz um setup do router para que escrevamos nossos códigos, por exemplo.

Se for o caso, podemos também criar no nosso arquivo de testes, um método que retorne uma instância da nossa conexão com o banco de dados, afim de que possamos simular o ambiente de nossos testes.

Abaixo, segue um exemplo de cada rota da nossa API recebendo um teste:

    package main

    import (
        "api-rest-go-gin/controllers"
        "api-rest-go-gin/database"
        "api-rest-go-gin/models"
        "bytes"
        "encoding/json"
        "fmt"
        "net/http"
        "net/http/httptest"
        "strconv"
        "testing"

        "github.com/gin-gonic/gin"
        "github.com/stretchr/testify/assert"
    )

    var (
        ID int
    )

    func SetupDasRotasDeTeste() *gin.Engine {
        gin.SetMode(gin.ReleaseMode)
        rotas := gin.Default()
        return rotas
    }

    func CriaAlunoMock() {
        aluno := models.Aluno{
            Nome: "Pedro Yoshimura",
            CPF:  "12864152924",
            RG:   "159357789",
        }

        database.DB.Create(&aluno)
        ID = int(aluno.ID)
    }

    func DeletaAlunoMock() {
        var aluno models.Aluno
        database.DB.Delete(&aluno, ID)
    }

    func TestListandoTodosOsAlunosHandler(t *testing.T) {
        database.GetConexao()

        CriaAlunoMock()
        defer DeletaAlunoMock()

        r := SetupDasRotasDeTeste()
        r.GET("/alunos", controllers.Index)

        req, _ := http.NewRequest("GET", "/alunos", nil)
        response := httptest.NewRecorder()
        r.ServeHTTP(response, req)

        assert.Equal(t, http.StatusOK, response.Code)
    }

    func TestBuscaAlunoPorIdHandler(t *testing.T) {
        database.GetConexao()
        CriaAlunoMock()
        defer DeletaAlunoMock()

        r := SetupDasRotasDeTeste()
        r.GET("/alunos/:id", controllers.Show)

        pathDaBusca := "/alunos/" + strconv.Itoa(ID)
        req, _ := http.NewRequest("GET", pathDaBusca, nil)
        response := httptest.NewRecorder()
        r.ServeHTTP(response, req)

        var alunoMock models.Aluno
        json.Unmarshal(response.Body.Bytes(), &alunoMock)

        assert.Equal(t, "Pedro Yoshimura", alunoMock.Nome)
        assert.Equal(t, "12864152924", alunoMock.CPF)
        assert.Equal(t, "159357789", alunoMock.RG)
    }

    func TestBuscaAlunoPorCPFHandler(t *testing.T) {
        database.GetConexao()
        CriaAlunoMock()
        defer DeletaAlunoMock()

        r := SetupDasRotasDeTeste()
        r.GET("/alunos/document/:cpf", controllers.FindByDocument)

        req, _ := http.NewRequest("GET", "/alunos/document/12864152924", nil)
        response := httptest.NewRecorder()
        r.ServeHTTP(response, req)
        assert.Equal(t, http.StatusOK, response.Code)
    }

    func TestEditaAlunoHandler(t *testing.T) {
        database.GetConexao()
        CriaAlunoMock()
        defer DeletaAlunoMock()

        r := SetupDasRotasDeTeste()
        r.PATCH("/alunos/:id", controllers.Update)

        aluno := models.Aluno{Nome: "Pedro Yoshimura", CPF: "12864152924", RG: "159357789"}
        valorJson, _ := json.Marshal(aluno)
        pathParaEditar := "/alunos/" + strconv.Itoa(ID)

        fmt.Println(pathParaEditar)

        req, _ := http.NewRequest("PATCH", pathParaEditar, bytes.NewBuffer(valorJson))
        response := httptest.NewRecorder()
        r.ServeHTTP(response, req)

        var alunoMockAtualizado models.Aluno
        json.Unmarshal(response.Body.Bytes(), &alunoMockAtualizado)
        assert.Equal(t, "Pedro Yoshimura", alunoMockAtualizado.Nome)
        assert.Equal(t, "12864152924", alunoMockAtualizado.CPF)
        assert.Equal(t, "159357789", alunoMockAtualizado.RG)
    }

    func TestDeletaAlunoHandler(t *testing.T) {
        database.GetConexao()
        CriaAlunoMock()

        r := SetupDasRotasDeTeste()
        r.DELETE("alunos/:id", controllers.Delete)

        pathDaBusca := "/alunos/" + strconv.Itoa(ID)
        req, _ := http.NewRequest("DELETE", pathDaBusca, nil)
        response := httptest.NewRecorder()
        r.ServeHTTP(response, req)

        assert.Equal(t, http.StatusOK, response.Code)
    }
