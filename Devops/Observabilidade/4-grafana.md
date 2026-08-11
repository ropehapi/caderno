# Grafana
O grafana nada mais é que uma visualização gráfica personalizavel de qualquer fonte (data source) que conectemos a ela. Por exemplo: podemos configurar um data source para o nosso servidor do prometheus, e a partir disso, o grafana pode alimentar seus dashboards com os dados dos exporters do prometheus.

Uma feature muito forte do grafana é a possibilidade de importação de dashboards prontos, pré construídos pela comunidade, de modo que apenas importando o código do dashboard, obtemos todo um dashboard configurado. Segue o link para o [marketplace de dashboards](https://grafana.com/grafana/dashboards/).

## Uso
Usa-lo em um projeto é simples. 
1. No docker compose: 
````
version: '3'

services:
  prometheus:
    image: prom/prometheus
    container_name: prometheus
    depends_on: 
      - cadvisor
    ports:
      - 9090:9090
    command:
      - --config.file=/etc/prometheus/prometheus.yml
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml:ro

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    container_name: grafana
    depends_on:
      - prometheus
````

2. Ao acessar http://localhost:3000, basta fazer um primeiro acesso usando admin:admin como login e senha.
3. Adicionar data source nas configurações
4. Importar/criar dashboards