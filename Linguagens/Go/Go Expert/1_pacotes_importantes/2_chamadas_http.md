# Chamadas HTTP

## Fazendo uma requisição GET

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