# **Aplicações WEB com Go**
Antes de mais nada: Por eu vir da WEB (PHP), vou me abster de explicar alguns conceitos da WEB como roteamento, servidores http, páginas HTML entre outros.

## **Subindo um servidor**
Para subirmos um servidor em Go, basta que chamemos dentro da função main uma função que seja responsável por ouvir e responder requisições. Essa função é a função `ListenAndServe` do pacote `Http`, que recebe como parâmetros a porta do servidor e o handler (Geralmente nil)

    http.ListenAndServe(":8000", nil)


## **Devolvendo uma view**
Para que possamos de fato devolver uma página web por exemplo, criaremos uma pasta template no nosso projeto, contendo todas as nossas páginas html, e em seguida, criamos uma variável temp no nosso main.go que será capaz de elencar nossas views da seguinte maneira:

    var temp = template.Must(template.ParseGlob("templates/*.html"));

Agora, basta que adicionemos uma rota na nossa aplicação que referencie a um método capaz de executar nossa view (Previamente construída, não entrarei no mérito de falar sobre o frontend).

    func main(){
        http.HandleFunc("/", index)
        http.ListenAndServe(":8000", nil)
    }

    func index(w http.ResponseWriter, r *http.Request){
        temp.ExecuteTemplate(w, "index", nil)
    }

Por úlltimo, basta que adicionemos uma flag no nosso arquivo html para que possamos de fato elencar aquele arquivo como uma view, da seguinte maneira:

    {{define "index"}}
        Corpo HTML
    {{end}}

### **Importando o Bootstrap**
Como nosso foco de longe não é frontend, importaremos o framework frontend bootstrap afim de facilitar nosso trabalho, dessa forma, nossa view ficará assim: 

        {{define "Index"}}
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
        <title>Alura loja</title>
    </head>
    <nav class="navbar navbar-light bg-light mb-4">
        <a class="navbar-brand" href="/">Alura Loja</a>
    </nav>

    <body>
        <div class="container">
            <section class="card">
                <div>
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Descrição</th>
                                <th>Preço</th>
                                <th>Quantidade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Camiseta</td>
                                <td>Bem bonita</td>
                                <td>29</td>
                                <td>10</td>
                            </tr>
                            <tr>
                                <td>Notebook</td>
                                <td>Muito rápido</td>
                                <td>1999</td>
                                <td>2</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

        </div>
    </body>

    </html>
    {{end}}

## **Passando e utilizando objetos na view**
Quando desejarmos renderizar em nossas views algum objeto de forma dinâmica, como por exemplo uma lista de produtos, basta que passemos o objeto como parâmetro na função `ExecuteTemplate`, e o chamemos na view, acessando suas propriedades através do `.Propriedade` (onde o "`.`" representa o objeto passado).

    	temp.ExecuteTemplate(w, "index", produtos)

        Na view:
        <tbody>
            {{range .}}
            <tr>
                <td>{{.Nome}}</td>
                <td>{{.Descricao}}</td>
                <td>{{.Preco}}</td>
                <td>{{.Quantidade}}</td>
            </tr>
            {{end}}
        </tbody>
