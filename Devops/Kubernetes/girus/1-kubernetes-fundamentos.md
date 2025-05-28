## 1. Explorando o Cluster
Aprenda a verificar os componentes básicos de um cluster Kubernetes. Nesta seção, você vai conhecer os comandos essenciais para inspecionar e entender a estrutura do seu cluster.

### Passos:
Verifique se o kubectl está instalado. O kubectl é a ferramenta de linha de comando que permite interagir com clusters Kubernetes:

> kubectl version

A saída acima mostra a versão do cliente (sua ferramenta kubectl) e a versão do servidor (o cluster Kubernetes).

Agora, verifique os nós do cluster executando:

> kubectl get nodes

Um nó é uma máquina de trabalho no Kubernetes (virtual ou física). Cada nó é gerenciado pelo plano de controle e contém os serviços necessários para executar os pods.

Para ver informações mais detalhadas sobre os nós, use a flag -o wide:

> kubectl get nodes -o wide

Este comando exibe informações adicionais como IPs internos, sistema operacional, versão do container runtime e muito mais.

Agora, vamos verificar os namespaces disponíveis:

> kubectl get namespaces

Namespaces são uma forma de dividir os recursos do cluster em grupos virtuais, permitindo o isolamento lógico entre aplicações.

Veja os pods do namespace kube-system, que contém os componentes internos do Kubernetes:

> kubectl get pods -n kube-system

Este namespace contém componentes críticos como o kube-dns (CoreDNS), kube-proxy, e outros componentes essenciais para o funcionamento do cluster.

Examine os detalhes de um nó específico (substitua NODE_NAME pelo nome do nó obtido anteriormente):

> kubectl describe node NODE_NAME

O comando describe fornece informações detalhadas sobre o recurso, incluindo capacidade, condições atuais, eventos e muito mais.

## 2. Criando um Pod
Aprenda a criar e gerenciar pods, que são a menor unidade executável no Kubernetes. Nesta seção, você criará seu primeiro pod e explorará as formas de interagir com ele.

### Passos:
Primeiro, vamos criar um namespace dedicado para nossos exercícios. Usar namespaces é uma boa prática para organizar e isolar recursos:

> kubectl create namespace k8s-demo

Resultado esperado: 'namespace/k8s-demo created'

Agora, vamos criar um pod do Nginx. Pods são a menor unidade que pode ser implantada no Kubernetes e consistem em um ou mais containers.

Crie um arquivo `pod.yaml` com o seguinte conteúdo:

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  namespace: k8s-demo
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
```
Explicação do arquivo:

apiVersion/kind: Define o tipo de recurso (Pod) e a versão da API <br>
metadata: Contém nome, namespace e labels (etiquetas) do pod<br>
spec: Define os containers que compõem o pod, incluindo imagem e portas<br>

Crie o pod aplicando o arquivo YAML:

> kubectl apply -f pod.yaml

Verifique se o pod está rodando. O status 'Running' indica que o pod está funcionando corretamente:

>kubectl get pods -n k8s-demo

Aguarde alguns segundos e verifique novamente, caso o status ainda não seja 'Running'.

Vamos verificar os logs do pod para confirmar que o Nginx está funcionando:

>kubectl logs nginx-pod -n k8s-demo

Agora, vamos acessar o shell do pod para explorar seu interior:

>kubectl exec -it nginx-pod -n k8s-demo -- /bin/bash

Você está agora dentro do container Nginx! Vamos verificar se o servidor web está respondendo:

curl localhost:80
Você deverá ver a página de boas-vindas do Nginx em HTML.

Digite 'exit' para sair do container e voltar ao seu terminal.

Para uma inspeção detalhada do pod, use o comando describe:

>kubectl describe pod nginx-pod -n k8s-demo

Este comando mostra detalhes como eventos, condições, volumes, e muito mais.

## 3. Explorando Deployments
Aprenda sobre Deployments, que são recursos de nível superior para gerenciar aplicações em escala no Kubernetes.

### Passos:
Os Deployments são recursos que gerenciam ReplicaSets, que por sua vez gerenciam Pods. Eles facilitam atualizações, escalabilidade e outras operações.

Vamos criar um Deployment do Nginx com 3 réplicas:

Crie um arquivo deployment.yaml com o seguinte conteúdo:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: k8s-demo
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
        ports:
        - containerPort: 80
```
Explicação do arquivo:

replicas: Número de pods idênticos a serem mantidos <br>
selector: Como o Deployment identifica os Pods que gerencia <br>
template: Modelo para os Pods que serão criados <br>

Aplique o arquivo YAML:

> kubectl apply -f deployment.yaml

Verifique se o Deployment foi criado:

> kubectl get deployments -n k8s-demo

Veja os Pods criados pelo Deployment:

> kubectl get pods -n k8s-demo -l app=nginx

Observe que o nome dos pods inclui o nome do deployment seguido por um identificador aleatório.

Vamos escalar o Deployment para 5 réplicas:

> kubectl scale deployment nginx-deployment --replicas=5 -n k8s-demo

Verifique os Pods novamente para confirmar o aumento de réplicas:

> kubectl get pods -n k8s-demo -l app=nginx

Para ver o histórico de implantações (útil para rollbacks):

> kubectl rollout history deployment nginx-deployment -n k8s-demo

