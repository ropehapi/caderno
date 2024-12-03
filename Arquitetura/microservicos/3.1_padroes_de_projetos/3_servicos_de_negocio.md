# Serviços de Negócio - Microserviços: Padrões de Projetos

## Introdução
No último vídeo, aprendemos a separar um data service usando o conceito de serviços de domínio. Agora, exploraremos os serviços de negócio, que lidam com operações que demandam mais de um domínio.

## Serviço de Negócio (Business Service)
- O serviço de negócio é a junção de diversos data services ou serviços de domínio.
- É utilizado quando operações complexas requerem a coordenação de vários domínios.

## Exemplo Prático
- Exemplo: Matricular um aluno pode envolver mais do que apenas inserir um aluno no serviço de alunos.
- Necessidade de registros no serviço financeiro e na gamificação.
- Detalhes mais complexos do que lidar com um único domínio.

## Processo de Negócio
- Identificação de um processo de negócio, por exemplo, matricular um aluno.
- O serviço de negócio representa processos de alto nível, como "matricular", orquestrando operações granulares.

## Encapsulamento de Domínios Relacionados
- Capacidade de encapsular domínios relacionados, simplificando o processo para o cliente da API.
- Exemplo: Aluno e matrícula financeira relacionados através do processo de matricular aluno.

## Criando um Serviço de Negócio
- Identificar o processo de negócio a ser exposto.
- Identificar os domínios necessários (aluno, matrícula financeira, jogador) em serviços diferentes.
- Definir a API focando no domínio, não nos detalhes dos dados.
- Receber a requisição no serviço de negócio, consultando os data services.

## Padrões e Próximos Passos
- Introdução à criação de um serviço de negócio e sua interação com data services.
- Destaque para a importância da identificação de processos de negócio.
- Abordagem sobre a definição da API, focando no domínio.
- Discussão sobre a necessidade de consumir e consultar serviços de dados.

## Conclusão
- Entendemos os tipos de serviços (data service, serviço de domínio, serviço de negócio).
- Próximo vídeo: Exploração de padrões para atingir esses objetivos e técnicas para compartilhar código, incluindo a transição de um monolito.

