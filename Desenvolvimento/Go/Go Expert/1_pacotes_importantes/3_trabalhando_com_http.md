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

## Servindo com HTTP
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

## Manipulando headers
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