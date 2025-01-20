# Consultando CEPs com Go
    package main

    import (
        "encoding/json"
        "fmt"
        "io"
        "net/http"
        "os"
    )

    type Endereco struct {
        Cep         string `json:"cep"`
        Logradouro  string `json:"logradouro"`
        Complemento string `json:"complemento"`
        Bairro      string `json:"bairro"`
        Localidade  string `json:"localidade"`
        Uf          string `json:"uf"`
        Ibge        string `json:"ibge"`
        Gia         string `json:"gia"`
        Ddd         string `json:"ddd"`
        Siafi       string `json:"siafi"`
    }

    func main() {
        for _, cep := range os.Args[1:]{
            url := "https://viacep.com.br/ws/"+cep+"/json/"
            req, err := http.Get(url)
            if err != nil {
                panic(err)
            }
            
            defer req.Body.Close()
            res, err := io.ReadAll(req.Body)
            if err != nil {
                panic(err)
            }
            var endereco Endereco
            err = json.Unmarshal(res, &endereco)
            if err != nil {
                panic(err)
            }
            fmt.Println(endereco)

            file, err := os.Create("endereco.txt")
            if err != nil {
                panic(err)
            }
            defer file.Close()
            _, err = file.WriteString(endereco.Cep)
            if err != nil {
                panic(err)
            }
        }
    }