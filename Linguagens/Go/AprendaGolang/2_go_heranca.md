# **Herança**
Ainda que Go não seja uma linguagem orientada a objetos, podemos utilizar o conceito de herança quando quisermos reutilizar os atributos de uma struct pai.

    type Pessoa struct{
        Nome string
        Idade uint8
    }

    type PessoaFisica struct{
        Pessoa
        cpf string
    }

    type PessoaJuridica struct{
        Pessoa
        cnpj string
    }

Para criar um objeto do tipo PessoaFisica e ler seus atributos por exemplo, podemos faze-lo da seguinte maneira:

    p := PessoaFisica{
        Pessoa{"Pedro", 19},
        "999.999.999-99"
    }

    fmt.Sprintf("Olá, meu nome é %s", p.Nome)

Podemos também ter dois atributos com o mesmo nome na struct pai e filho. Dessa forma, para acessar o valor definido na struct pai, é necessário adicionar mais uma instrução para acessar o atributo.

    type PessoaFisica struct{
        Pessoa
        Nome, cpf string
    }

    p := PessoaFisica{
        Pessoa{"Pedro",19},
        "Yoshimura",
        "999.999.999-99"
    }

    fmt.Sprintf("O nome da struct Pessoa é %s e o da struct Pessoa física é %s", p.Pessoa.Nome, p.Nome)