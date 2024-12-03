# Aula: Um ou Mais DBs

## Introdução
- Boas-vindas a mais um capítulo sobre microsserviços e como arquitetar esses projetos.
- Abordaremos a questão de como lidar com os dados de microsserviços.

## Single Service Database
- Objetivo: Um serviço tem um banco de dados dedicado.
- Também chamado de Single Database ou Single Service.
- Cada microsserviço possui seu próprio banco de dados.

## Escalabilidade e Recursos
- A escalabilidade de um serviço está ligada diretamente ao banco de dados que ele acessa.
- Exemplo: Microsserviço de matrícula pode ter menos requisições diárias e usar um servidor menos robusto.
- Exemplo: Microsserviço acadêmico que lida com vídeos pode exigir um banco de dados e máquina mais potentes.

## Shared Service Database
- Cenários onde dados precisam estar centralizados por motivos contratuais.
- Exemplo: E-mail do aluno e detalhes de pagamento podem estar no mesmo banco de dados devido a um contrato.

## Desafios do Shared Service Database
- Problema: O banco de dados compartilhado precisa escalar conforme a necessidade do microsserviço que demanda mais recursos.
- Proposta: Tratar o banco compartilhado como se fossem bancos separados para garantir a independência dos microsserviços.

## Abordagem Prática
- Mesmo em cenários de Shared Service Database, trate cada banco em cada serviço como se fossem separados.
- Conexão independente e acesso independente para garantir a independência dos microsserviços.
- Impacto menor em código ao evoluir para bancos separados se necessário.

## Padrões de Codificação
- Falaremos sobre alguns padrões de codificação que podem ajudar na construção de microsserviços complexos no próximo vídeo.
