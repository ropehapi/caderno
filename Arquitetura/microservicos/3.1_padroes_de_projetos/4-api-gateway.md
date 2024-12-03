# API Gateway - Integrando Serviços

## Introdução
Boas-vindas a mais um capítulo deste treinamento, onde exploramos microsserviços, discutimos conceitos e padrões para trabalhar com essa arquitetura. Agora, abordaremos a integração entre diversos microsserviços, com foco em um conceito fundamental: o API Gateway.

## Comunicação e Integração
- A comunicação entre microsserviços é crucial, mas a integração vai além disso.
- Como garantir um ponto único de entrada em um ambiente de microsserviços?

## Desafios de Diversidade
- Diferentes microsserviços podem ter URLs, padrões e formatos de dados distintos.
- Necessidade de unificar e manter uma API consistente para clientes.

## API Gateway
- **Definição:**
  - Ponto único de entrada que direciona solicitações para os serviços corretos.
  - Abordagem para simplificar a complexidade da comunicação entre microsserviços.

- **Desafios:**
  - Ponto central de falha.
  - Necessidade de escala e gerenciamento cuidadoso.

## Implementação e Padrão de Projeto
- API Gateway é implementado como um serviço ou servidor web externo.
- Similar ao padrão de projeto "Facade", simplificando a API em um nível mais arquitetural.

## Desvantagem e Trade-offs
- **Desvantagem:**
  - Pode se tornar um ponto central de falha.

- **Trade-offs:**
  - Ganho em simplificação, perda na dependência crítica.

## Comportamentos do API Gateway
- Autorização e redirecionamento de requisições.
- Adição ou remoção de cabeçalhos, modificação da requisição.
- Limitação de acesso ou conteúdo trafegado.

## Próximos Passos
- API Gateway é um componente essencial, mas existe outra abordagem para limitação de acesso e conteúdo.
- No próximo vídeo, exploraremos outro padrão para agregar processos.

Espero que essa explicação sobre o API Gateway tenha sido esclarecedora. Nosso próximo tópico será outro padrão importante para a integração de microsserviços.
