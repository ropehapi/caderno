# Go expert
## Disclaimer
Por se tratar de um curso que eu comprei no intuito de me aprofundar na linguagem, vou me abster de transcrever para cá os módulos de introdução, configuração de ambiente e fundação, que já foram previamente estudados no [curso da Alura](https://github.com/ropehapi/caderno/tree/main/Linguagens/Go/Alura).

## Indice
Como a melhor forma de aprender é praticando, envés de anotar aqui todos os conhecimentos que adquiri com os módulos do curso, listarei projetos desenvolvidos ao longo do curso contendo suas respectivas explicações em seus readmes e comentários em código.

- [api-go-expert](https://github.com/ropehapi/api-go-expert)
- [upload-s3-go-expert](https://github.com/ropehapi/upload-s3-go-expert)
- [cobra-cli-go-expert ](https://github.com/ropehapi/cobra-cli-go-expert )
- [manipulando-eventos-go-expert ](https://github.com/ropehapi/manipulando-eventos-go-expert )
- [graphql-go-expert](https://github.com/ropehapi/graphql-go-expert)
- [grpc-go-expert ](https://github.com/ropehapi/grpc-go-expert )
- [desafio-client-server-go-expert](https://github.com/ropehapi/desafio-client-server-go-expert)
- [desafio-multithreading-go-expert](https://github.com/ropehapi/desafio-multithreading-go-expert)
- [desafio-clean-architecture-go-expert ](https://github.com/ropehapi/clean-architecture-go-expert )

## Anotações
Esse artigo tem o intuito de conter pequenos fragmentos de anotações sobre o curso, tendo em vista que já é um assunto que eu conheço, e pode não ser pertinente explicar todo um contexto.

- Todo arquivo .go com exceção do main DEVE pertencer a um package com o nome do diretório em que o arquivo se encontra.

- No go, somos habilitados a criar nossos próprios tipos. Para isso, basta declara-lo da seguinte maneira: `type ID int`.

- Existem duas maneiras alternativas de se inicializar um map vazio: 
        
        mapa := make(map[string]int)
        ou
        mapa := map[string]int{}

- Podemos criar um erro para retornar na nossa função da seguinte maneira:

        return x, errors.New("Meu erro aqui")

- O Go dispõe de uma ferramenta muito útil para poupar nosso trabalho quando precisamos fechar alguma coisa que foi aberta para que não fiquemos ocupando memória desnecessáriamente, como uma conexão com o banco, um stream de dados de uma requisição etc. Essa ferramenta é o comando `defer`, um statement que faz atrasar a execução de uma instrução para quando o nosso código terminar de ser executado. Segue um exemplo, onde a primeira linha será impressa por último.

        func main(){
                defer fmt.println("Primeira linha")
                fmt.println("Segunda linha")
                fmt.println("Terceira linha")
        }
