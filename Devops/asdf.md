# ASDF
O [asdf](https://asdf-vm.com/) é um gerenciador de dependências e versões que tem o intuito de facilitar o uso de diferentes versões de uma ferramenta no mesmo ambiente.

Por exemplo: Você tem a necessidade de rodar em sua máquina de dev vários projetos que contam com diferentes versões de suas ferramentas, como um projeto PHP rodando a versão 7.4 e o Laravel 6, e outro rodando a versão 8.2 com o Laravel 9. A maneira mais fácil de transitar entre essas duas versões da ferramenta é utilizando o asdf.

Eu posso passar um tempo aqui tentando explicar o uso do asdf, mas dificilmente eu conseguirei fazer isso com mais maestria que o Rafael camargo [nesse vídeo](https://www.youtube.com/watch?v=8W3xaSPjeog).

## Instalação
O processo para instalar o asdf não é tão trivial, portanto, acesse a [documentação oficial](https://asdf-vm.com/guide/getting-started.html) para melhor compreensão.

## Comandos
Adiciona um plugin ao seu asdf: `asdf plugin add <linguagem/tecnologia>`

Lista todos os seus plugins e versões: `asdf list`

Lista todos os seus plugins: `asdf plugin list`

Lista todas as versões de um plugin instaladas: `asdf list <linguagem/tecnologia>`

Lista todas as versões de um plugin para instalar: `asdf plugin list all <linguagem/tecnologia> | less`

Instala uma determinada versão do plugin: `asdf install <linguagem/tecnologia> \<versao>`

Seta uma versão como a desejada: `asdf global <linguagem/tecnologia> \<versao>`