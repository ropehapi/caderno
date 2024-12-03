# Aula: Comunicação Assíncrona

## Introdução
- Exploração da comunicação assíncrona entre microsserviços.
- Comparação com a comunicação síncrona.

## Cenários de Uso
1. **Pedido de Compra**
   - Exemplo de processo assíncrono.
   - Ações paralelas, como validação, separação de estoque e processamento de pagamento.

2. **Técnicas Utilizadas**
   - **CQRS (Command Query Responsibility Segregation)**
     - Separação de responsabilidades entre comandos e consultas.
     - Processamento assíncrono em segundo plano.

   - **Eventos com Mensageria (e.g., Kafka)**
     - Notificação assíncrona de eventos.
     - Comunicação entre microsserviços sem dependência direta.

## Exemplos Práticos
1. **Compra Online**
   - Pedido aceito imediatamente, processos assíncronos posteriormente.
   - Demonstração do fluxo: validação, pagamento, separação de estoque e logística.

2. **Envio de E-mails**
   - Assincronicidade na entrega de e-mails.
   - Exemplo: envio de e-mail que não necessita de resposta imediata.

## Implementação Prática
1. **Técnicas de Implementação**
   - Utilização de mensageria para eventos assíncronos.
   - Aplicação do conceito de CQRS para comandos e consultas.

2. **Opções de Infraestrutura**
   - Uso de sistemas de mensageria (e.g., Kafka) e filas de tarefas.
   - Exploração de alternativas para alcançar a assincronicidade.

## Próxima Aula: Tratamento de Falhas
- Discussão sobre como lidar com falhas na comunicação síncrona e assíncrona.
- Estratégias para garantir a confiabilidade e consistência do sistema.
