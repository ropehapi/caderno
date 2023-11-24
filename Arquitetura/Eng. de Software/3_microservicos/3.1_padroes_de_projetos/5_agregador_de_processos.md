# Agregador de Processos - Aula 3

## Introdução
Como mencionei, exploraremos agora o conceito de agregar processos. Nos serviços de domínio e negócio, um serviço de negócio agrega vários serviços de domínio para formar um processo completo.

## Agregador de Processos
- Um agregador de processos reúne diversos desses processos.
- Menos comum, usado em situações com processos complexos que dependem de vários outros processos.

## Exemplo Prático
- Ao renovar a matrícula de um aluno, vários processos estão envolvidos.
- Inclui matrícula, atualização de dados, pagamento, e até análise de dados (Business Intelligence).

## Process Aggregator Pattern
- Serviço de mais alto nível que agrega serviços de negócio.
- Similar aos serviços de negócio que agregam serviços de domínio.
  
## Lógica de Processamento
- O agregador de processos pode e deve ter alguma lógica de processamento.
- Exemplo: Ajustar mensagens e dados antes de retornar a resposta ao cliente.

## Construção do Agregador de Processos
- Ao construir, definimos um novo modelo para o sistema.
- Este modelo representa os dados agregados, criando um novo subdomínio no sistema.

## API e Novo Modelo
- Ao criar um agregador, definimos uma nova API baseada no novo modelo.
- Exemplo: `api.alura.com.br/renovacaodematriculas`.

## Considerações Finais
- A criação é complexa, pois envolve vários processos.
- Um novo modelo é criado, representando um novo subdomínio no sistema.

## Próximo Tópico
No próximo vídeo, abordaremos a ideia de gateways específicos para cada cliente, aprofundando ainda mais nossos conceitos de arquitetura.

Espero que esta explicação sobre o Agregador de Processos tenha sido útil. Nosso próximo tópico será uma extensão dessa conversa, falando sobre gateways específicos para clientes.
