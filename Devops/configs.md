# Configs
Sempre que eu formato meu computador preciso ficar configurando minhas variáveis de ambiente no linux.
Para evitar dor de cabeça, segue os exports necessários a incluir no `.bashrc`

```
export PATH="$PATH:/opt/GoLand-2024.3.2.1/bin"
export PATH="$PATH:/opt/Postman"
export PATH="$PATH:/usr/local/go/bin"
```

*Obs: Tudo o que estiver dentro de `/usr/local/bin` já está no path de sudo.

*Obs: Para não precisar digitar senha no sudo:
> sudo visudo

Adicionar isso no final do arquivo:
> seu_usuario ALL=(ALL) NOPASSWD: ALL