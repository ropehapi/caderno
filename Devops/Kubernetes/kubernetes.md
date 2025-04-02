# Anotações Kubernetes (k8s)
*kind*: Ferramenta para instalar e usar o kubernetes rodando containers docker, sem precisar de VM ou um cloud provider

*Minikube*: Parecido com o Kind porém instala uma VM na sua máquina para provisionar esses containers

*Kubectl*: Client para interagir com o k8s. Segue [link para instalação](https://kubernetes.io/pt-br/docs/tasks/tools/) do kubectl e kind. 

## Comandos kind e kubectl
> kind create cluster

> kind get cluster

> kind delete clusters <name>

> kind create cluster --config=\<dir-para-arquivo-de-conf> --name=\<name>

> kubectl cluster-info --context kind-\<nome>

> kubectl config get-clusters

> kubectl config use-context kind-\<name>

> kubectl apply -f \<diretorio-do-arquivo-de-conf-do-pod>

Para caso dê errado adicionar o contexto:
> kind get kubeconfig --name \<name> > ~/.kube/config && 
export KUBECONFIG=~/.kube/config