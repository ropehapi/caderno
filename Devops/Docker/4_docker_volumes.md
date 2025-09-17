# Volumes

## Bind mounts vs -v
Pelo fato de um container não guardar estado, muitas vezes você vai querer persistir seus dados em algum arquivo ou transporta-los para dentro do seu container; E isso pode ser feito de duas maneiras:

### Bind mount
> docker run -d --name nginx -p 8080:80 --mount type=bind,source="$(pwd)/<diretório da sua máquina>,target=<diretório de destino dentro do container>

### Criando volume 
> docker run -d --name nginx -p 8080:80 -v "$(pwd)/<diretório da sua máquina>:<diretório de destino dentro do container>

### Qual a f***ing diferença?
Ambos os comandos criam um volume por debaixo dos panos;Porém com a diferença de que com a flag -v, se o diretório em questão na sua máquina não existir, você o cria automáticamente.