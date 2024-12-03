# Tipos de Serviços - Conhecendo a Arquitetura

## Introdução
Já discutimos amplamente as vantagens e desvantagens de microsserviços, falamos sobre a web e aplicações monolíticas. Agora, vamos nos concentrar em padrões reais e tipos de microsserviços.

## Data Services
- **Definição:**
  - Serviços que expõem dados, agindo como uma camada fina antes do banco de dados.
  - Mantêm a consistência dos dados, realizando processamento necessário.

- **Exemplo Prático:**
  - Preenchimento de campos, como a data de atualização de um produto.
  - Garantia de consistência e processamento de dados inválidos.

## Business Services
- **Definição:**
  - Serviços que consomem dados e oferecem operações mais complexas.
  - Além de consumir dados, podem acessar diretamente o banco de dados.

- **Diferenciação:**
  - Distinção entre serviços que fornecem dados e os mantêm consistentes e serviços que agregam dados, fornecendo operações complexas.

## Translation Services
- **Definição:**
  - Facilitam o acesso a recursos externos com controle.
  - Exemplo: Consumir um serviço de log externo com um serviço intermediário para maior controle.
  
## Edge Services
- **Definição:**
  - Serviços entregues diretamente ao cliente.
  - Atendem a necessidades específicas de clientes, como web e mobile.

- **Exemplo Prático:**
  - Edge service para clientes web e outro para clientes mobile, atendendo a necessidades específicas de cada plataforma.

## Conclusão
Esses são os principais tipos de microsserviços, incluindo data services, business services, translation services e edge services. Nos próximos capítulos, aprofundaremos cada categoria conceptualmente e discutiremos a implementação prática. É fundamental compreender essas distinções ao explorar microsserviços.

## Próximo Capítulo
Agora que discutimos os tipos de serviços, abordaremos como categorizamos e implementamos cada serviço conceptualmente no próximo capítulo.
