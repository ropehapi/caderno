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
