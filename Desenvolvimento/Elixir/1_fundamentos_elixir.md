# Fundamentos do elixir
## O que é elixir?
Elixir é uma linguagem de programação funcional, concorrente, de propósito geral que executa na máquina virtual Erlang (BEAM). Elixir compila em cima de Erlang para fornecer aplicações distribuídas, em tempo real suave, tolerante a falhas, non-stop, mas também a estende para suportar metaprogramação com macros e polimorfismo via protocolos.

## Por que estudar elixir?
- Funcional
- Brasileira
- Roda na ErlangVM
    - Disponibilidade
    - Escalabilidade
    - Tolerância a falhas
    - Amplamente testada
- Elegante e amigável

## Instalação
Antes de instalar o elixir, é preciso ter a ErlangVM instalada na máquina. [Neste link](https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp) pode-se verificar a compatibilidade entre cada
versão do elixir e sua respectiva ErlangVM.
Para um mais fácil gerenciamento das versões do erlang e do elixir, recomendo a instalação das ferramentas através do [ASDF](https://asdf-vm.com/).
- Erlang: https://github.com/asdf-vm/asdf-erlang
- Elixir: https://github.com/asdf-vm/asdf-elixir

## O IEX
O IEX é o interpretador interativo do elixir, que pode ser chamado rodando o comando iex após a ferramenta estar devidamente instalada. Nele é possível executar códigos elixir de maneira interativa, semelhante ao ruby, python, php etc.

## Tipos básicos
- Int: 1
- Float: 1.5
- String: "Yoshimura"
- Atom: :yoshimura
- Boolean: true
- Nil: nil
- Lista: [1,1.5, "Lista", true, :atom, nil] (Muito diferente de array!!!)
- Tupla: {:ok, "Stringzona"}

## Funcional x Orientação a objetos
- OO: "StRiNg".downcase()
- Funcional: String.downcase("StRiNg")

## Imutabilidade
O Elixir trabalha com um conceito muito importante que é a imutabilidade, conceito esse que faz com que quando o valor de uma variável é "alterado",
essa "variável" nao tem seu valor de fato alterado, e sim só é criado um
novo endereço na memória para o novo valor, e o apontamento da variável passa a ser para esse novo endereço na memória, enquanto o anterior segue existindo (isso será tratado pelo Garbage collector posteriormente).

## Keyword lists
Método utilizado para passar opções de parâmetros para funções:
```
x = [{:a, "valor1"},{:b, "valor2}]
```

## Maps
Pares de chave valor muito utilizados:
```
iex> x = %{a: 1, b: 2}
iex> x[:a]
1
iex> x[:b]
2
```

## O módulo enum
O elixir não dispoõe de funções de recursividade como while, foreach etc, porém, nos é disponibilizado o módulo Enum. que oferece uma série de funções para manipular listar e tuplas.

## Pattern matching
O pattern matching é uma das features mais poderosas do elixir, algo diferente de todas as outras linguagens, e é indispensável para o desenvolvimento usando o elixir.
Não me atrevo a tentar explicar como isso funciona, recomendo que leia:
- [Documentação oficial](https://elixirschool.com/pt/lessons/basics/pattern_matching)
- [Artigo no Dev.to](https://dev.to/trybe/uma-introducao-ao-pattern-matching-2hl4)

## Pipe operator
Decido à característica de o elixir ser uma linguagem de programação funcional e imutável, o time da tecnologia decidiu criar o 
pipe operator, visto que por uma "variável" jamais ter seu valor de fato alterado e sim apenas passar por um pipe de transformações.

Assim como no kernel linux, o pipe operator pega o resultado de uma operação e automáticamente o passa como o primeiro parâmetro da chamada seguinte.
```
iex> "PeDrO yOsHiMuRa   " |> String.trim() |> String.downcase()
```

