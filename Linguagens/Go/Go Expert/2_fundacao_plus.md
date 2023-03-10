# **Fundação Plus**
Neste artigo, explicarei mais sobre algumas coisas que fazem parte da fundação do Go, porém não foram abordadas em momentos anteriores.

## **Composição de structs**
Afim de termos estruturas mais consistentes, nós podemos aninhar nossas structs, como por exemplo da seguinte maneira:

    type Pessoa Struct{
        Nome string
        Idade string
        Endereco
    }

    type Endereco Struct{
        Rua string
        Numero int
    }

    pessoa := Pessoa{
        Nome: "Yoshimura",
        Idade: 19,
        Rua: "Professor carlos Weiss",
        Numero: 39
    }