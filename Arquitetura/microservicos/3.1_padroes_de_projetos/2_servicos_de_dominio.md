# Serviços de Domínio - Microserviços: Padrões de Projetos

## Introdução
Boas-vindas de volta a mais um capítulo do treinamento sobre microsserviços. Nesta aula, vamos abordar a separação de serviços, discutindo como decidir qual parte da aplicação monolítica se torna um determinado tipo de serviço.

## Data Service e Serviços de Domínio
- **Data Service:**
  - Vamos começar discutindo um tipo de serviço chamado data service.
  - A decisão de separar um data service é frequentemente baseada no uso de serviços de domínio.

- **Serviços de Domínio:**
  - Para chegar a serviços de domínio, é importante ter conhecimento do Domain-Driven Design (DDD).
  - A prática do DDD ajuda a identificar domínios bem definidos para separá-los em serviços, como data services.

## Modelagem do Domínio
- Começamos modelando o domínio, sem pensar na persistência inicialmente.
- Exemplo prático: Serviço de domínio para um aluno na Alura.
  - O serviço terá regras específicas, como a necessidade de um e-mail, seguindo as práticas do DDD.

## Definição de Ações
- Avaliamos as ações que serão disponibilizadas publicamente pelos serviços.
- Exemplo: Ao matricular um aluno, decidimos se é uma simples inserção ou envolve ações mais complexas.
- Detalhes do contrato, como os verbos HTTP utilizados, são importantes para a definição das ações.

## Implementação
- Construímos o serviço, implementando primeiro o contrato e depois a lógica.
- Exemplo prático: Decidindo entre inserir um aluno ou matriculá-lo, escolhendo o verbo HTTP apropriado.

## REST e RPC
- Aceitamos que REST e RPC podem coexistir.
- O Action Pattern em aplicações RESTful permite a exposição de recursos e ações.

## Detalhes de Exposição do Serviço
- Estudamos HTTP para decidir como expor o serviço.
- Consideramos se liberamos todos os dados via REST ou filtramos alguns detalhes.
- A manipulação direta do recurso é cuidadosamente pensada.

## Considerações Finais
- Reconhecemos que um microsserviço de aluno é um exemplo de um serviço de domínio muito pequeno.
- Exploração de casos em que um serviço pode exigir mais do que um único domínio é deixada para o próximo vídeo.
