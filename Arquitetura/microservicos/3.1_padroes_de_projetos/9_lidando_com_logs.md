# Aula: Lidando com Logs

## Introdução
- Bem-vindo a mais um capítulo sobre microsserviços, abordando agora as operações envolvidas.
- Vamos discutir a importância dos logs em microsserviços e como lidar com eles.

## Logs em Microsserviços
- Debugar microsserviços é desafiador, tornando os logs ainda mais cruciais.
- Vamos focar em uma perspectiva de alto nível.

## Agregação de Logs
- Agregar logs de todos os microsserviços é essencial.
- Padronização do formato de logs entre os serviços é necessária para facilitar a leitura como se fosse uma única aplicação.

## Formato e Taxonomia de Logs
- Logs devem ter um formato compartilhado, como texto separado por vírgulas.
- Taxonomia (classificação de logs) deve ser comum entre os serviços para organização e categorização eficientes.

## Agregação em Microsserviços
- Diferentemente dos monolitos, logs em microsserviços são gerados em locais distintos, exigindo cuidados especiais para agregação.
- A metodologia de "twelve-factor application" preconiza logs como strings de dados, permitindo um serviço externo coletar e analisar esses logs.

## Tracing e Rastreamento de Chamadas
- Logs são cruciais para rastrear chamadas e realizar tracing.
- Serviços específicos podem organizar e apresentar um equivalente a uma stack trace.
- Estudo sobre padrões de trace ID é recomendado para manter a consistência e facilitar o rastreamento.

## Identificadores e Ferramentas
- É vital gerar identificadores (trace ID) para rastrear operações entre serviços.
- Ferramentas de gerenciamento, como Application Performance Management (APM), são essenciais para visualizar e analisar essas stack traces.

## Conclusão
- Lidar com logs em microsserviços é um desafio, mas crucial para operações eficientes.
- Próximo tópico: métricas do sistema em microsserviços.

Não se esqueça de enriquecer as anotações com o seu conhecimento adicional sobre o assunto.
