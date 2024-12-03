# Aula: Como se Comunicar - Visão Geral

## Introdução
- Revisão do progresso no treinamento sobre microsserviços.
- Exploração da comunicação entre microsserviços.

## Desafios da Comunicação Direta
1. **Dependências Descontroladas**
   - Dificuldade de atualização.
   - Comprometimento da independência dos microsserviços.

2. **Falhas em Cascata**
   - Possibilidade de uma falha afetar outros microsserviços.
   - Impacto negativo na aplicação como um todo.

3. **Problemas de Performance**
   - Resposta lenta de um microsserviço afeta outros dependentes.
   - Comprometimento da eficiência da aplicação.

## Estratégias para Evitar Problemas
1. **API Gateways (Edge Services)**
   - Entrada única para a aplicação.
   - Facilita monitoramento, cache e autenticação.
   - API Gateways específicos para diferentes clientes (mobile, web).

2. **Event Bus (Canal de Publicação/Inscrição)**
   - Comunicação entre microsserviços sem dependência direta.
   - Possibilidade de comunicação assíncrona.
   - Facilita monitoramento e escalabilidade.

## Comunicação Síncrona vs. Assíncrona
- Exploração dos tipos de comunicação e suas características.
- Próxima aula: Comunicação Síncrona entre Microsserviços.
