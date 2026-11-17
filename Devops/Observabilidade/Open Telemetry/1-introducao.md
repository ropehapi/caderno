# Open telemetry
Basicamente, o OTEL é um framework open source que nos permite exportar nossas métricas de observabilidade para quaisquer vendors de forma padronizada. Tanto faz se será exibido no Jaeger ou Zipkins, processado por data dog ou Elastic search. A gente coleta com o OTEL e envia para o vendor.

O que é o Open Telemetry?
- Framework de observabilidade para softwares cloud native
- Conjuntos de ferramentas, APIs e SDKs
- Instrumentação, geração, coleta e exportação de dados de telemetria

Componentes principais
- Especificações
    - Dados
    - SDKs
    - APIs
- Collectors
    - Agente ou serviço
    - Pipeline
        - Recebimento
        - Processamento
        - Envio dados
    - Vendor-agnostic 
- Libs
    - Vendor-agnostic
    - Tracing e logs
    - Auto tracing
- Logs
    - Em andamento

Tipos de collector
- Sem collector
- Sidecar
- Collector server

Instrumentação
- Manual
- Automática