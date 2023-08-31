# Pacotes importantes

## Manipulação de arquivos
### Criando um arquivo
    func main(){
        f, err := os.Create("arquivo.txt")
        if err != nil {
            panic(err)
        }
        f.Close()
    }

### Gravando dados em um arquivo
    func main(){
        f, err := os.Create("arquivo.txt")
        if err != nil {
            panic(err)
        }

        tamanho, err := f.WriteString("Escrevendo texto no arquivo")
        ou
        tamanho, err := f.Write([]byte("Escrevendo dados no arquivo"))

        if err != nil {
            panic(err)
        }
        fmt.Printf("Arquivo criado com sucesso! Tamanho: %d bytes", tamanho)

        f.Close()
    }

### Lendo dados de um arquivo
    func main(){
        //Leitura
        arquivo, err := os.ReadFile("arquivo.txt")
        if err != nil{
            panic(err)
        }

        fmt.Println(string(arquivo))

        //Leitura de pouco em pouco
        arquivo, err := os.Open("arquivo.txt")
        if err != nil {
            panic(err)
        }
        reader := bufio.NewReader(arquivo)
        buffer := make([]byte, 10)
        for {
            n, err := reader.Read(buffer)
            if err != nil {
                break
            }
            fmt.Println(string(buffer[:n]))
        }
    }

### Removendo um arquivo
    func main(){
        err = os,Remove("arquivo.txt")
        if err != nil {
            panic(err)
        }
    }

## Trabalhando com JSON

### Serializando dados em um JSON
    Type Conta struct {
        Numero, saldo int
    }

    func main(){
        conta := Conta{Numero:1,Saldo:500}
        res, err := json.Marshall(conta)
        if err != nil {
            panic(err)
        }
        println(string(res))
    }

No exemplo acima, nós armazenamos nossa serialização em json em uma variável chamada `res` e a exibimos. Porém, podemos também transformar já devolvendo o resultado do json, e nesse caso podemos usar o `Encoder`, que é um cara que recebe um valor e faz um encoding gravando em outro lugar.

    func main(){
        conta := Conta{Numero:1,Saldo:500}
        res, err := json.Marshall(conta)
        if err != nil {
            panic(err)
        }
        println(string(res))

        err = json.NewEncoder(os.Stdout).Encode(conta)
        if err != nil {
            panic(err)
        }
    }

### Deserealizando um json em uma struct
    func main(){
        jsonPuro := []byte(`{"Numero":2, "Saldo":208}`)
        var conta Conta
        err = json.Unmarshal()
        if err != nil {
            println(err)
        }
        println(conta.Saldo)
    }

### Bindando structs para receber json
Podemos querer instruir ao nosso json qual campo da nossa struct ele deve preencher, para isso, podemos bindar nossas structs da seguinte maneira:

    type Conta struct {
        Nome string `json:"-"` //Estamos ignorando o attr no json
        Numero int `json:"numero"`
        Saldo int `json:"saldo"`
    }

## Chamadas HTTP

### Fazendo uma requisição GET

    func main(){
        req, err := http.Get(url)
        if err != nil {
            panic(err)
        }
        res, erro := io,ReadAll(req.Body)
        if err != nil {
            panic(err)
        }
        fmt.Println(string(res))
        req.Body.Close()
    }

### Servindo com HTTP
Servir uma aplicação HTTP com Go é simples e precisa de apenas uma linha:

    func main(){
        http.ListenAndServe(":8080", nil)
    }

Com a nossa aplicação servindo, basta que atrelemos a ela todas as manipulações que esse servidor receberá, as famosas rotas. Podemos fazer isso da seguinte maneira:

    func main() {
        http.HandleFunc("/", HelloWorld)
        http.ListenAndServe(":8080", nil)
    }

    func HelloWorld(w http.ResponseWritter, r *http.Request) {
        w.Write([]byte("Hello world"))
    }

### Manipulando headers
Manipular os headers de uma requisição no Go é simples, basta que usemos as interfaces ResponseWriter e Request de chamadas HTTP para nos fornecerem mpetodos.

    func BuscaCepHanlder(w http.ResponseWritter, r *http.Request) {
        if r.URL.Path != "/" {
            w.WriteHeader(http.StatusNotFound)
            return
        }

        cepParam := r.URL.Query().Get("cep")
        if cepParam == "" {
            w.WriteHeader(http.StatusBadRequest)
            return
        }

        w.Header().Set()("Content-Type", "application/json")
        w.WriteHeader(http.StatusOk)
        w.Write([]byte("Hello world"))
    }