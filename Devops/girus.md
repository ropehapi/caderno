# Girus-cli
O girus nada mais é do que uma ferramenta para aprendizado de devops baseado em ambientes laboratoriais disponibilizados através do kind, sendo manipulado através do ferramentário do girus.

Uma explicação mais bem elaborada sobre o funcionamento da ferramenta pode ser encontrada [aqui](https://github.com/badtuxx/girus-cli).

Uma apresentação feita pelo Jeff da Linux tips (criador da ferramenta) pode ser encontrado [aqui](https://www.youtube.com/watch?v=kSQ7nM-QF1g).

Um artigo oficial da Linux tips apresentado a ferramenta pode ser encontrado [aqui](https://linuxtips.io/girus-labs/).

### Usando o girus na prática
Nada melhor que a prática. Abaixo deixarei os comandos para instalar e subir o girus:

> curl -sSL https://raw.githubusercontent.com/badtuxx/girus-cli/main/install/install.sh | bash

> girus create cluster

Simples né? É só rodar isso e voila, acesse a url `http://localhost:8000` e divirta-se com os laboratórios.

Terminou a brincadeira?
> girus delete cluster