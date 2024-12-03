# Rest: Conteitos e fundamentos
REST(Representational State Transfer, que significa Transferência Representacional de Estado) é um modelo de arquitetura e não uma linguagem ou tecnologia de programação, que fornece diretrizes para que os sistemas distribuídos se comuniquem diretamente usando os princípios e protocolos existentes da Web sem a necessidade de SOAP ou outro protocolo sofisticado.

## A origem do termo REST
Os conceitos do REST foram submetidos à tese de doutorado de Roy Fielding nos anos 2000, onde o princípio fundamental é usar o protocolo HTTP para comunicação de dados.

A arquitetura REST é simples e fornece acesso aos recursos para que o cliente REST acesse e renderize os recursos no lado do cliente. No estilo REST, URI ou IDs globais ajudam a identificar cada recurso.

Esta arquitetura usa várias representações de recursos para representar seu tipo, como XML, JSON, Texto, Imagens e assim por diante.

Vale ressaltar que o REST não se limita a solicitações e respostas de registros. Também é possível inserir um novo registro ou deletar um já existente.

## Responsabilidades no REST
Existe no REST um princípio chamado STATELESSNESS (sem estado), onde o servidor não precisa saber em qual estado o cliente está e vice-versa. Mas o que é um servidor e um cliente?

Cliente: é o componente solicitante de um serviço e envia solicitações para vários tipos de serviços ao servidor.

Servidor: É o componente que é o provedor de serviços e fornece continuamente serviços ao cliente conforme as solicitações

Nesta arquitetura ou modelo, cliente-servidor ajuda na separação de responsabilidades entre a interface do usuário e o armazenamento de dados. Ou seja, quando uma solicitação REST é realizada, o servidor envia uma representação dos estados que foram requeridos.

Não há limite superior no número de clientes que podem ser atendidos por um único servidor. Também não é obrigatório que o cliente e o servidor residam em sistemas separados.

A comunicação entre cliente e servidor ocorre através da troca de mensagens usando um padrão de solicitação-resposta. O cliente basicamente envia uma solicitação de serviço e o servidor retorna uma resposta.

## Requisições e comunicações
O REST precisa que um cliente faça uma requisição para o servidor para enviar ou modificar dados. Um requisição consiste em:

Um verbo ou método HTTP, que define que tipo de operação o servidor vai realizar;
Um header, com o cabeçalho da requisição que passa informações sobre a requisição;
Um path (caminho ou rota) para o servidor, como por exemplo https://www.alura.com.br/artigos/golang-trabalhando-com-datas;
Informação no corpo da requisição, sendo esta informação opcional.

## Métodos HTTP
Em aplicação REST, os métodos mais utilizados são:

O método GET é o método mais comum, geralmente é usado para solicitar que um servidor envie um recurso;
O método POST foi projetado para enviar dados de entrada para o servidor. Na prática, é frequentemente usado para suportar formulários HTML;
O método PUT edita e atualiza documentos em um servidor;
O método DELETE que como o próprio nome já diz, deleta certo dado ou coleção do servidor.
Neste link você encontrará a lista completa de todos os métodos.

## Códigos de Respostas
Cada resposta que a aplicação REST retorna, é enviado um código definindo o status da requisição. Por exemplo:

200 (OK), requisição atendida com sucesso;
201 (CREATED), objeto ou recurso criado com sucesso;
204 (NO CONTENT), objeto ou recurso deletado com sucesso;
400 (BAD REQUEST), ocorreu algum erro na requisição (podem existir inumeras causas);
404 (NOT FOUND), rota ou coleção não encontrada;
500 (INTERNAL SERVER ERROR), ocorreu algum erro no servidor.
Estes são os principais, porém neste link você encontrará a lista completa do código de cada requisição.

## Conclusão
Neste artigo, apresentamos a origem, conceitos e os principais fundamentos do REST. Os cursos de programação da Alura podem ajudar você a começar, aprender e se desenvolver em tecnologia e, além disso, depois você pode se aprofundar e utilizar essa arquitetura no gerenciamento de estados do React, por exemplo.