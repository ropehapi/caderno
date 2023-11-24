# Aula: Lidando com Falhas

## Introdução
- Importância de lidar com falhas em microsserviços.
- Diferenças entre comunicação síncrona e assíncrona.

## Estratégias para Lidar com Falhas (Comunicação Síncrona)
1. **Proxy Reverso (Circuit Breaker)**
   - Adição de um proxy na frente do microsserviço.
   - Funciona como um curto-circuito em caso de falha.
   - Evita sobrecarga no servidor durante falhas.

2. **Utilização de Cache**
   - Cache de processamentos pesados.
   - Possibilidade de manter alguma resposta para o usuário durante falhas.

## Estratégias para Lidar com Falhas (Comunicação Assíncrona)
1. **Retry**
   - Tentativa de reenvio de mensagens após falhas.
   - Pode resolver problemas temporários.

2. **Retry com Back-Off**
   - Afastamento entre tentativas de reenvio.
   - Evita sobrecarga contínua e aguarda uma possível recuperação.

3. **Mensageria com Mecanismos Implementados**
   - Serviços de mensageria geralmente possuem mecanismos automáticos.
   - Tratamento de mensagens duplicadas e entrega fora de ordem.

4. **Idempotência**
   - Conceito de que chamadas repetidas produzem o mesmo resultado.
   - Importante para garantir consistência em operações repetidas.

## Considerações Finais
- Automatização de tratamentos de falha em serviços de mensageria.
- Importância de estar preparado para receber mensagens fora de ordem e lidar com possíveis duplicatas.
- Próxima aula: Como os microsserviços se descobrem na rede?

## Próxima Aula: Descoberta de Serviços
- Exploração de como os microsserviços podem se encontrar na rede.
- Discussão sobre estratégias de descoberta de serviços e comunicação entre eles.
