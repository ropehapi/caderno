# Kubernetes (k8s)
Kubernetes, frequentemente referido como K8s, é uma plataforma de código aberto que automatiza a implantação, escalonamento e gerenciamento de aplicativos em contêineres. Abaixo, elucidarei como se criam configurações para um cluster kubernetes e como essa ferramenta funciona.

### Observações iniciais
*kind*: Ferramenta para instalar e usar o kubernetes rodando containers docker, sem precisar de VM ou um cloud provider

*Minikube*: Parecido com o Kind porém instala uma VM na sua máquina para provisionar esses containers

*Kubectl*: Client para interagir com o k8s. Segue [link para instalação](https://kubernetes.io/pt-br/docs/tasks/tools/) do kubectl e kind. 

### Hierarquia entre os tipos de configurações
Dentro dos vários tipos de arquivo de configuração yaml que podemos criar para nosso kubernetes, existem os tipos Deplyoment, replicasets e pods. Esses arquivos podem ser aplicados na configuração do nosso kubernetes através do comando `kubectl apply -f \<arquivo>`.

Um arquivo descreevendo um pod fará exatamente isso, descreverá um a ser criado. Um arquivo descrevendo um replicaset deverá especificar quantas réplicas do pod (que será descrito no mesmo arquivo) deverão ser instanciadas, enquanto o arquivo de deployment, idêntico ao do replicasets (apenas com a mudança no kind), erguerá pods de um determinado replicaset x para cada versão. Nesse cenário, não é necessário matar os pods do replicaset para aplicar as alterações, pois o deployment se encarrega de substituir por outro replicaset mais atual.

Dentro desse diretório, deixei uma pasta contendo vários arquivos de configuração e um ambiente preparado para você explorar o kubernetes.
Deixando claro, eu não pretendo explicar detalhadamente a definição de cada um dos arquivos de configuração, apenas deixa-los de exemplo.

### Services
As services nada mais são do que a porta de entrada para a nossa aplicação. Subir 10 pods da nossa aplicação de nada adiantaria sem que os expusessemos através de uma service, que nesse contexto além de atuar como porta de entrada das requisições, atua como load balancer.

As services podem ser definidas em alguns tipos:
- ClusterIP: Esse tipo de service define um ip fixo que pode ser chamado de dentro desse cluster (Possui dns com o nome do service).
- NodePort: Tipo de serviço mais arcaico do kubernetes, permite a exposição dos seus nodes através de uma porta única (desde que >30000 e < 32767).
- LoadBalancer: Esse tipo de serviço deve ser usado apenas em um provedor de nuvem, pois assim ele irá expor sua aplicação para a web através de um ip público.

*Fique atento, port é a porta do seu service, enquanto a target port é a porta do seu container.*

### Objetos de configuração
Há alguns tipos de objetos de configuração que foram definidos no deployment da aplicação. Eles não serão estritamente abordados aqui porém estão exemplificados no `deployment.yaml`.

- Variaveis de ambiente
- Config map
- Secrets

### Probes
Probes são um instrumento do kubernetes que nos permitem verificar o estado de nossos conteiners para utiliza-los. Esses probes podem ser feitos tanto como um health-check durante a vida do nosso container como um readiness-check feito durante o startup do nosso container.

Há alguns tipos de probes:
- Liveness probe
- Readiness probe
- Startup probe

O uso dos probes acima podem ser encontrados no `deployment.yaml`.

### Resources e HPA (Horizontal pod autoscaling)
Para usar esse cara nós p

## Comandos
### Comandos básicos de gerenciamento de clusters e afins
> kind create cluster

> kind get cluster

> kind delete clusters <name>

> kind create cluster --config=\<dir-para-arquivo-de-conf> --name=\<name>

> kubectl cluster-info --context kind-\<nome>

> kubectl config get-clusters

> kubectl config use-context kind-\<name>

> kubectl apply -f \<diretorio-do-arquivo-de-conf-do-pod-replicaset-ou-depployment>

> kubectl port-forward pod/\<podname> \<porta-no-seu-pc>:\<porta-do-container>

> kubectl get replicasets

> kubectl rollout history \<tipo> \<nome> (ex: deployment goserver)

> kubectl rollout undo \<tipo> \<nome> (ex: deployment goserver)

> kubectl rollout undo \<tipo> \<nome> --to-revision=2

> kubectl proxy --port=8080 //Permite acessar a api do kubernetes

### Comandos para manipular services
> kubectl get services


### Para caso dê errado adicionar o contexto:
> kind get kubeconfig --name \<name> > ~/.kube/config && 
export KUBECONFIG=~/.kube/config