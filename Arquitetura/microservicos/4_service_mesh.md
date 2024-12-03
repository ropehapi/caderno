# Service mesh

Service Mesh é uma camada que podemos adicionar na infraestrutura da nossa aplicação para remover algumas responsabilidades do código como rastreamento de requests, observabilidade e até algumas técnicas de release.

Enquanto um API Gateway é responsável pelo tráfego norte a sul, que é o tráfego que inicia no nosso cliente, vem pra dentro da nossa aplicação, é processado e devolvido para o cliente, o service mesh é responsável pelo tráfego leste a oeste, ou seja, as comunicações que acontecessem dentro da nossa rede interna, dentro dos nossos serviços.

Assim sendo, dentro do nosso ambiente interno, uma requisição nunca será feita de um serviço diretamente para o outro, e sim passará por dentro do proxy sidecar desse nosso service mesh (Istio por exemplo) que será o responsável por fazer todas as operações necessárias, como operações de observabilidade, logs, métricas etc.

![Alt text](/src/img/service-mesh.png)