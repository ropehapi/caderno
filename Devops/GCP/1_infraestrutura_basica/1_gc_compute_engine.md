# Google Cloud  Compute Engine: escalabilidade e alta disponibilidade

O Google Cloud Platform (GCP) é uma das principais plataformas de computação em nuvem do mercado, oferecendo uma gama completa de serviços de infraestrutura, desenvolvimento, análise de dados, aprendizado de máquina e muito mais. Reconhecida pela sua tecnologia inovadora e pela mesma infraestrutura robusta que suporta os produtos de consumo do Google, como o YouTube, o Gmail e o Google Search, o GCP é especialmente atraente para empresas que buscam flexibilidade, segurança e escalabilidade em seus processos.

Esse provedor investe fortemente em áreas de inteligência artificial e machine learning, oferecendo ferramentas avançadas como o Google BigQuery e o AutoML, que permitem análises de dados em escala e automação de processos complexos. Além disso, o GCP destaca-se pelo seu compromisso com a sustentabilidade, sendo um dos primeiros provedores de nuvem a operar com energia 100% renovável, o que é um diferencial importante para empresas que priorizam práticas ambientais responsáveis.

## Provisionando uma aplicação

## Utilizando a CLI gcloud
Aqui vai um [link](https://docs.cloud.google.com/compute/docs/connect/create-ssh-keys) para a documentação oficial da GCP ensinando a configurar uma chave ssh para o seu ambiente de conectividade com a google cloud.

Nesta aula, o instrutor Ricardo Merces ensina como realizar acesso remoto a instâncias do Google Cloud Compute Engine utilizando a CLI gcloud, com foco na utilização de chaves SSH para uma conexão segura.

Os principais pontos abordados são:

1. Geração de chaves SSH:
    Utilização do comando ssh-keygen no Linux ou Mac para gerar um par de chaves (pública e privada). No Windows, é recomendado o uso do puttygen.

    A chave privada deve ser mantida em segurança e nunca compartilhada, enquanto a chave pública será utilizada para configurar o acesso à instância.
2. Adicionando a chave pública ao Google Cloud:
    Acessar a instância no Google Cloud Console, clicar em "Editar" e localizar a seção "Chaves SSH".

    Copiar o conteúdo da chave pública (incluindo o algoritmo e o usuário) e colar no campo correspondente.
3. Conexão SSH:
    Ajustar as permissões da chave privada para garantir que apenas o proprietário tenha acesso de leitura (comando chmod 400).
    
    Utilizar o comando ssh -i <chave_privada> <usuário>@<ip_da_instância> para se conectar à instância.

Além disso, o instrutor demonstra como automatizar a criação de instâncias com scripts e provisionar o storage para armazenar os dados da aplicação.

### preparando o bucket e SDK
Nesta aula, o instrutor demonstra como preparar o ambiente para colocar o conteúdo do site no Cloud Storage do Google Cloud Platform (GCP), visando alta disponibilidade. Ele explica a importância de ter um ponto único de publicação para o site, utilizando o Cloud Storage para armazenar tanto os dados quanto o front-end.

O processo envolve a criação de um bucket no Cloud Storage e a instalação do gcloud SDK, que permite interagir com os serviços do Google Cloud a partir da linha de comando. O instrutor mostra como baixar, instalar e configurar o gcloud SDK, além de apresentar o gsutil, uma ferramenta essencial para publicar o conteúdo do front-end no Cloud Storage.

Em resumo, a aula prepara o terreno para a criação de uma infraestrutura de alta disponibilidade no GCP, utilizando o Cloud Storage como um componente chave para armazenar e distribuir o conteúdo do site.

### Acesso ao storage com gsutil
Nessa aula, aprendemos a configurar o SDK do Google Cloud utilizando o comando gcloud init, que permite a autenticação e o link com o projeto no Google Cloud.

Além disso, foi demonstrado como utilizar o gsutil, uma ferramenta da suíte gcloud, para interagir com o Google Cloud Storage. Especificamente, aprendemos a copiar arquivos e diretórios para um bucket, utilizando o comando gsutil cp -r, e a importância de usar a flag -m para realizar processos em paralelo e aumentar a velocidade da operação.

Por fim, foi mencionado que os objetos copiados para o bucket não são públicos por padrão e que a configuração de permissões será abordada em aulas futuras, assim como a otimização da cópia e ajustes na aplicação.

## Escalando o site
### Criando uma imagem
Nesta aula, o instrutor Ricardo ensina como criar uma imagem de uma instância do Google Cloud Compute Engine. Essa imagem servirá como base para criar uma infraestrutura redundante e escalável para o site em produção.

Os principais pontos abordados foram:

    A importância de criar uma imagem da instância para garantir que a cópia seja exata do que está no disco, sem dados abertos em memória.
    Os comandos gcloud para listar as instâncias (gcloud compute instances list), parar uma instância (gcloud compute instances stop instance-2) e criar uma imagem (gcloud compute images create site-producao –source-disk instance-2).
    A relação entre VMs e discos, e como os discos servem de base para as imagens.
    Onde encontrar as imagens criadas na console do Google Cloud (em "Images") e como listá-las usando o comando gcloud compute images list.

### Template e instance group
Nessa aula, o instrutor Ricardo Merces explica como escalar uma aplicação no Google Cloud utilizando o Compute Engine. Ele demonstra o processo de criação de um template de instância e um grupo de instâncias, que são os componentes chave para o autoscaling.

Primeiro, ele cria um template de instância a partir de uma imagem já existente, definindo as configurações básicas da VM que será utilizada como base para o grupo. Em seguida, ele cria um grupo de instâncias, especificando a região, as zonas onde as instâncias podem ser criadas e o template que será utilizado.

O instrutor também aborda a configuração do autoscaling, definindo a métrica de utilização da CPU como gatilho para a criação de novas instâncias. Ele define o target de utilização da CPU em 70%, o número mínimo de instâncias em 2 e o número máximo em 10.

Ao final da aula, o instrutor propõe um exercício para que o aluno crie seu próprio grupo de instâncias e teste o autoscaling, verificando se novas instâncias são criadas quando a utilização da CPU atinge o limite definido.

### Testando auto scaling
Nesta aula, o foco é demonstrar como testar o auto scaling em um ambiente de produção, preparando-o para alta disponibilidade.

Inicialmente, é estabelecido um IP de produção para o site, e é explicado que o Instance Group criará novas máquinas com IPs distintos. Para resolver a questão de como o cliente será direcionado a esses diferentes IPs, será utilizado um Load Balancer, que será abordado na próxima etapa.

Além disso, a aula aborda a importância de manter as instâncias atualizadas através de scripts de automação e demonstra como monitorar o escalonamento através do console do Google Cloud, utilizando gráficos para auxiliar no planejamento.

Por fim, é mencionado que as instâncias podem levar até dez minutos para serem desalocadas após a interrupção do tráfego, e é apresentado o comando "gcloud compute instances list" para verificar o número de máquinas em execução. O objetivo final é configurar um Load Balancer com um IP único para o cliente, permitindo que o Google Cloud distribua o tráfego internamente.

## Alta disponibilidade
### Ip dedicado
Nesta aula, o foco é a criação de um Load Balancer para garantir alta disponibilidade e escalabilidade do seu site.

Primeiro, é explicado como o Load Balancer atua como um ponto de contato único para os clientes, distribuindo o tráfego entre várias instâncias do seu site, que podem ter IPs diferentes. Em seguida, você aprende a reservar um IP estático para o Load Balancer, garantindo que ele não mude quando a instância for reiniciada.

Depois, o processo de criação do Load Balancer é demonstrado, incluindo a configuração do back-end para direcionar o tráfego para o grupo de instâncias que você já criou. Além disso, é abordada a possibilidade de balancear o tráfego entre diferentes grupos de instâncias em diferentes zonas, aumentando ainda mais a disponibilidade do seu site.

### Detalhes do load balancer
Nesta aula, o instrutor Ricardo Merces explica como configurar um Load Balancer no Google Cloud Compute Engine para garantir alta disponibilidade. Ele aborda os seguintes pontos:

    Health Check: Configuração do teste de saúde para monitorar a disponibilidade das instâncias, definindo o intervalo de testes e critérios para considerar uma instância saudável ou não.
    
    Host and Path Rules: Explicação de como direcionar requisições para diferentes backends com base no host ou caminho da URL, mostrando um cenário onde isso seria útil, mas mantendo a configuração padrão para o caso em questão.

    Frontend Configurations: Configuração do frontend do Load Balancer, definindo o protocolo (HTTP), o endereço IP público e associando-o ao DNS para que as requisições dos clientes cheguem ao Load Balancer.
    Apontamento do DNS: Demonstração de como editar as configurações de DNS usando o Freenom (um serviço de DNS gratuito) para apontar o domínio para o IP do Load Balancer. Ele ressalta que as alterações no DNS podem levar algum tempo para serem propagadas.

    Teste: Explicação de como testar se o apontamento do DNS está correto usando o comando "dig" para verificar se o domínio resolve para o IP do Load Balancer.

### Content delivery network
Nesta aula, o instrutor Ricardo Merces demonstra como testar e ajustar uma estrutura de alta disponibilidade no Google Cloud Compute Engine. Ele começa testando o load balancer, fazendo alterações nas instâncias para exibir informações diferentes e verificar se o balanceamento de carga está funcionando corretamente.

Em seguida, ele discute a importância de configurar as regras do firewall, restringindo o acesso SSH a um range de IPs específicos para aumentar a segurança.

Por fim, ele ensina como ativar o CDN (Content Delivery Network) para melhorar o desempenho do site, armazenando em cache o conteúdo e entregando-o de forma mais rápida aos usuários.