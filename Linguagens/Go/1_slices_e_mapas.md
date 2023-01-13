# **Slices e Maps**
***Antes de mais nada: Por se tratar de algo que já foi explicado anteriormente na [introdução à linguagem](https://github.com/ropehapi/caderno/tree/main/Linguagens/Go/Alura/1_go_introducao.md), vou me abster de explicar a diferença entre Arrays e Slices, e explicarei apenas os Slices.***

## **Slices**
Slices em Go nada mais são que arrays por debaixo dos panos, porém otimizados para serem mais performáticos em se tratando de alocação de memória, através da manipulação dos tamanhos desses arrays por debaixo dos panos.

Note que, no exemplo abaixo, se definirmos um slice inicial com 4 valores e inspecionarmos seu tamanho e capacidade, teremos o resultado de 4 registros e capacidade para 4.

Porém, a partir do momento que adicionamos mais um valor ao nosso slice, ele aumenta sua capacidade para 8, pois por debaixo dos panos oq ele está fazendo é preparando o nosso array para receber até 8 valores, pois se ele aumentasse a capacidade do array para 5, ele teria que incrementar a sua capacidade a cada registro, dessa maneira, apenas quando o slice chegar a 8 valores, sua capacidade será aumentada novamente da mesma maneira.

    nomes := []string{"Tiago","Dani","Marcos","Maria"}
    fmt.Println(nomes, len(nomes), cap(nomes))

    nomes = append(nomes,"Rafael")
    fmt.Println(nomes, len(nomes), cap(nomes))

    nomes = append(nomes,"Rubia")
    fmt.Println(nomes, len(nomes), cap(nomes))

Quando quisermos iniciar um slice vazio, que deve ser incrementado conforme nosso código é executado, podemos faze-lo da seguinte maneira:

    nomes := make([]string, tamanho, capacidade)

## **Maps**
Mapas nada mais são que Hash tables, ou seja, tipo de dado onde passamos uma chave, que pode ser uma string, um int, um booleano, e o valor dessa chave, que não necessariamente devem ter o mesmo tipo.

    idades := make(map[string]int)
    idades["Tiago"] = 31
    idades["Dani"] = 36
    idades["Maria"] = 23

Vale ressaltar que nos maps, a sequência dos índices, não necessariamente serão confiáveis depois para ser recuperados, pois são embaralhados.

Podemos também precisar validar se determinada chave existe no nosso map, e isso geralmente é feito da seguinte maneira:

    val, ok := idades["Lucas"]