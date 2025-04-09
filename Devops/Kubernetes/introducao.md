# Anotações Kubernetes (k8s)
*kind*: Ferramenta para instalar e usar o kubernetes rodando containers docker, sem precisar de VM ou um cloud provider

*Minikube*: Parecido com o Kind porém instala uma VM na sua máquina para provisionar esses containers

*Kubectl*: Client para interagir com o k8s. Segue [link para instalação](https://kubernetes.io/pt-br/docs/tasks/tools/) do kubectl e kind. 

### Hierarquia entre os tipos de configurações
Dentro dos vários tipos de arquivo de configuração yaml que podemos criar para nosso kubernetes, existem os tipos Deplyoment, replicasets e pods. Esses arquivos podem ser aplicados na configuração do nosso kubernetes através do comando `kubectl apply -f \<arquivo>`.

Um arquivo descreevendo um pod fará exatamente isso, descreverá um a ser criado. Um arquivo descrevendo um replicaset deverá especificar quantas réplicas do pod (que será descrito no mesmo arquivo) deverão ser instanciadas, enquanto o arquivo de deployment, idêntico ao do replicasets (apenas com a mudança no kind), erguerá pods de um determinado replicaset x para cada versão. Nesse cenário, não é necessário matar os pods do replicaset para aplicar as alterações, pois o deployment se encarrega de substituir por outro replicaset mais atual.

## Comandos kind e kubectl
### Primeiros passos na prática
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

### Services
> kubectl get services


### Para caso dê errado adicionar o contexto:
> kind get kubeconfig --name \<name> > ~/.kube/config && 
export KUBECONFIG=~/.kube/config