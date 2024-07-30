# Fizz Buzz
O fizz buzz é um conceito de algoritmo que visa receber uma lista de números e a partir dessa lista, ele deve substituir os múltiplos de 3 por fizz e os múltiplos de 5 por buzz, enquanto os múltiplos de ambos como 
o 15 se tornam fizz-buzz

## Mix 
O mix é uma ferramenta do elixir para a manipulação dos projetos.
- mix new <nome_projeto>
- mix compile
- mix test
- mix format
- mix deps.get

## Estrutura básica dos diretorios
- Lib: Onde vão ficar todos os arquivos do projeto
- Test: Onde vão ficar todos os testes do projeto
- Mix.exs: Equivalente ao composer.json

## Credo
O [Credo](https://github.com/rrrene/credo) é uma lib elixir que serve como um linter para nosso projeto. Para executá-lo, basta rodar um `mix credo`.

O que vai ser ou não levado em consideração pelo credo pode ser configurado através de um arquivo credo.exs, presente na doc da lib.

## Módulos
Abaixo escreverei um módulo, e junto com ele a explicação de alguns conceitos.
```
defmodule Player do
    @required_keys [:life, :moves, :name] //Definição de variáveis de módulo
    @max_life 100

    @enforce_keys @required_keys //Definição de propr. obrigatórias
    defstruct @required_keys //Definição de um struct
end
```