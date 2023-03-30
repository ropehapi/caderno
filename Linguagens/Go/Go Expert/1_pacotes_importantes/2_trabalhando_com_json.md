# Trabalhando com JSON

## Serializando dados em um JSON
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

## Deserealizando um json em uma struct
    func main(){
        jsonPuro := []byte(`{"Numero":2, "Saldo":208}`)
        var conta Conta
        err = json.Unmarshal()
        if err != nil {
            println(err)
        }
        println(conta.Saldo)
    }

## Bindando structs para receber json
Podemos querer instruir ao nosso json qual campo da nossa struct ele deve preencher, para isso, podemos bindar nossas structs da seguinte maneira:

    type Conta struct {
        Nome string `json:"-"` //Estamos ignorando o attr no json
        Numero int `json:"numero"`
        Saldo int `json:"saldo"`
    }