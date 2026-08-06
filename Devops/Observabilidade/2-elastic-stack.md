# Elastic stack
Antigamente havia a stack ELK:
- Elastic search: Search engine e analytics
- Logstash: Processador de dados através de pipelines que consegue receber, transformar e enviar dados simultâneamente
- Kibana: Permite usuários a visualizarem os dados do elasticsearch em diversas perspectivas

## Logstash
- Engine coletora de dados em tempo real
- Iniciou como manipulador de logs
- Trabalha com pipelines
- Recebe dados de múltiplas fontes
- Normaliza e transforma dados
- Envia dados para múltiplas fontes
- Possui plugins

## Kibana
- Ferramenta de visualização e exploração de dados
- Usada com: logs, análise de séries, monitoramento de aplicações, e inteligência operacional
- Integrado com oElasticsearch
- Agregadores e filtragem de dados
- Dashboards
- Gráficos interativos
- Mapas

## Beats e Elastic stack
A diferença entre o ELK stack e o elastic stack é que o elastic stack é a versão mais moderna da stack utilizando os beats.
### Beats
- "Lightweight data shipper"
- Agente coletor de dados
- Integrado facilmente com elasticsearch ou logstash
- Logs, métricas, Network data, Audit data, uptime e monitoring
- Você pode criar seu próprio beat


## Anotações
- Para uma aplicação com um volume de dados muito grande escalar no elastic search, ela trabalha de forma distribuída através de "shards" que possuem redundância de dados