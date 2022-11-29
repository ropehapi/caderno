# Go
Antes de mais nada: Tem um levantamento do porque eu escolhi estudar a linguagem Go no meu [Notion]("https://marked-bakery-837.notion.site/An-lise-Node-x-Golang-219f881022c94a06ad11cf81e4d6a2cf")

## Introdução
A linguagem [Go]("https://go.dev"), também conhecida como GoLang, é uma linguagem open source que foi criada pelo Google em 2007, e desde então é utilizada para a construção de produtos e serviços de grande escala. Atualmente a linguagem é utilizada por diversas empresas, como Uber, Twitch, Medium e Mercado livre.

Go é uma linguagem simples e produtiva de se utilizar, com foco no desenvolvimento de aplicações que necessitam de alta performance.

## Algumas características notáveis sobre o GO
- Compilada
- Estaticamente tipada
- Paradigma de programação concorrente
- Única e exclusivamente Backend

## Instalação
[Documentação de instalação da linguagem]("https://go.dev/doc/install")

### Ubuntu
1. Faça o download do arquivo `.tar` do Go e navegue com o terminal até a pasta aonde o arquivo foi baixado. Use o comando abaixo para extraí-lo em sua pasta `/usr/local`:

    $ `sudo tar -C /usr/local -xzf nome-arquivo`

2. Em seguida precisamos adicionar o caminho `/usr/local/go/bin` no `PATH` do sistema. Você pode fazer isto adicionando uma linha extra no arquivo `/etc/profile`, por exemplo com o editor de textos gedit. Abra o arquivo `/etc/profile` com o gedit utilizando o comando abaixo:

    $ `sudo gedit /etc/profile`

3. E em seguida adicione a seguinte linha no final do arquivo:

    `export PATH=$PATH:/usr/local/go/bin` 

4. Salve a alteração e feche o editor.

5. Agora utilize o comando:

    $ `source /etc/profile`

O Go já deve estar funcionando com sucesso! Faça o teste em seu terminal com o comando go version e veja se a versão e os comandos do Go foram exibidos corretamente.

