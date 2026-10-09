# Linux setup
Esse guia tem como propósito servir de suporte durante o setup inicial de qualquer ambiente linux meu.

## Terminal
Antes de mais nada, siga esse guia sobre o [setup do meu zsh]((zsh_setup.md)).

*Obs: Tudo o que estiver dentro de `/usr/local/bin` já está no path de sudo.

### Permissões
Para não precisar digitar senha no sudo:
> sudo visudo

Adicionar isso no final do arquivo:
> seu_usuario ALL=(ALL) NOPASSWD: ALL

## Apps
Abaixo, segue uma lista de links para ferramentas que eu uso no meu dia dia
- [Nvm](https://nodejs.org/pt-br/download)
- [Brew](https://brew.sh/)
- [K9s](https://github.com/derailed/k9s)
- [Asdf](https://asdf-vm.com/)
- [Lazydocker](https://github.com/jesseduffield/lazydocker)
- Tilix (sudo apt-get install tilix)