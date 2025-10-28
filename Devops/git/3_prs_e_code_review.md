# Template para PRs
Para adicionar um template de PR, como um texto sugerindo algumas guidelines a seguir ao criar um PR, basta criar um arquivo chamado `PULL_REQUEST_TEMPLATE.md` dentro do diretório `.github/`.

# Definindo codeowners
Muitas vezes pode ser interessante definirmos "responsáveis" pela revisão de certa parte de um projeto. Para isso, podemos criar uma configuração de code owners, que dita quem deve revisar um PR a partir de onde o código foi alterado.

Podemos fazer isso simplesmente criando um arquivo `CODEOWNERS` dentro da pasta `.github/` e definindo-o, como por exemplo:
```
*.js @nouqen
*.go @ropehapi
*/src/models/lancer @ropehapi
```

Após isso, basta nas configurações do repositório selecionar a opção "require review from codeowners".