# Assinatura de commits
Assinar commits nada mais é do que uma forma de autenticar um commit através de uma chave GPG, comprovando a autoria de um commit. Abaixo, colocarei um passo a passo para você criar uma chave GPG e adicionar ao GitHub de forma a passar a assinar os seus commits.

## Passo a passo:
Criando uma nova GPG Key
```
gpg --full-generate-key
```
Aqui, algumas questões aparecerão no seu terminal, como tipo de chave que você deseja (RSA, DSA etc), tamanho de bits da chave, expiração e seu user id (que deve ser igual ao seu user id configurado global config), email e uma senha para assinar a chave.

Após criar uma chave, liste todas  as suas chaves GPG:
```
gpg --list-secret-key --keyid-form LONG
```
Exporte a sua chave com:
```
gpg --armor --export <id da sua chave>
```
Após isso, adicione a sua chave GPG ao seu github em configurações > SSH and GPG Keys.

Configure seu git adicionando sua chave GPG:
```
git config --global user.signinkey <id da sua chave>
```
Não se esqueça de adicionar a variável a seguir no seu .nashrc:
```
export GPG_TTY=$(tty)
```
Configure seu git para sempre assinar por padrão um commit com sua chave GPG
```
git config --global commit.gpgsign true
git config --global tag.gpgSign
```