# Guia Completo: Setup do Zsh para Desenvolvedores

## 1. Instalar o Zsh

``` bash
sudo apt update
sudo apt install zsh -y
chsh -s $(which zsh)
```

Reinicie o terminal.

------------------------------------------------------------------------

## 2. Instalar Oh My Zsh

``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

------------------------------------------------------------------------

## 3. Instalar Powerlevel10k

``` bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Editar `.zshrc`:

``` bash
nano ~/.zshrc
```

Alterar:

``` bash
ZSH_THEME="robbyrussell"
```

Para:

``` bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Aplicar:

``` bash
source ~/.zshrc
```

------------------------------------------------------------------------

## 4. Instalar Plugins

### Autosuggestions

``` bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Syntax Highlighting

``` bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

------------------------------------------------------------------------

## 5. Ativar Plugins

Editar `.zshrc`:

``` bash
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

Aplicar:

``` bash
source ~/.zshrc
```

------------------------------------------------------------------------

## 6. Aliases úteis

``` bash
alias ..="cd .."
alias ...="cd ../.."

alias ls="ls --color=auto"
alias ll="ls -lah"

alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
```

------------------------------------------------------------------------

## 7. Extras recomendados

### fzf

``` bash
sudo apt install fzf
```

### exa

``` bash
sudo apt install exa
```

Adicionar ao `.zshrc`:

``` bash
alias ls="exa --icons"
alias ll="exa -lah --icons"
```

------------------------------------------------------------------------

## Resultado

Você terá: - Autocomplete inteligente - Sugestões em tempo real - Prompt
avançado com Git - Melhor produtividade no terminal
