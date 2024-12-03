# Aula: Eventos Assíncronos

## Introdução
- Vamos abordar o tema complexo de eventos, mais especificamente, eventos assíncronos.
- Este tópico está fortemente relacionado a microsserviços e não ao modelo orientado a eventos, como o event sourcing.

## Cenários para Eventos Assíncronos
- Alguns problemas não podem ser resolvidos em tempo real.
- Exemplo: Processo de validação antifraude na matrícula da Alura.
  - O pagamento está sendo processado assincronamente.
- O aluno recebe uma resposta imediata, mas o processamento acontece em segundo plano.

## Exemplo Prático: Envio de E-mail
- Enviar e-mail é um cenário simples para eventos assíncronos.
- Formulário de contato: Após clicar, o servidor pode enviar a resposta imediatamente e processar o envio de e-mail em segundo plano.
- Tecnologias como filas de mensagerias (RabbitMQ, ZeroMQ) e serviços de stream de dados (Kafka) são úteis para esses cenários.

## Importância em Microsserviços
- Microsserviços envolvem considerações de escalabilidade e performance.
- Eventos assíncronos são uma abordagem para lidar com dados que chegam e precisam ser processados por outra aplicação ou serviço.

## Tecnologias Relacionadas
- Filas de mensagerias (RabbitMQ, ZeroMQ) e serviços de stream de dados (Kafka) são ferramentas essenciais para lidar com eventos assíncronos.

## Complexidade dos Eventos Assíncronos
- Eventos assíncronos são complexos e abrangem diversos tópicos.
- Em treinamentos de Domain-Driven Design (DDD), eventos de domínio são discutidos em detalhes.
- É crucial estudar e compreender esse padrão ao lidar com microsserviços.

## Próximos Passos
- Após discutir comunicação entre serviços, integração, manipulação de dados e eventos assíncronos, abordaremos as operações relacionadas aos microsserviços.
- Tópicos como monitoramento, logs e outras operações de infraestrutura em microsserviços serão explorados no próximo capítulo.