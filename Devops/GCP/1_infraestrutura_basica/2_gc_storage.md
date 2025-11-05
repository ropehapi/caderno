# Google Cloud Storage: Armazenamento de objetos na GC
Nesse módulo aprenderemos a:
- Ggerenciar buckets
- Versionamento e as permissões
- Site estático
- SDK para operar os buckets
- Regras para o ciclo de vida dos objetos
- Benefícios do Cloud Storage
- Como transferir dados entre AWS e Cloud Storage

## O primeiro bucket
### Criando um bucket
Nesta aula sobre Google Cloud Storage, o foco é a criação de um bucket, que é um repositório para armazenar arquivos na nuvem.

Você aprenderá a:

    Criar uma conta no Google Cloud e entender o conceito de "Free Tier".
    Navegar no Google Cloud Console e acessar o Google Cloud Storage.
    Criar um bucket, escolhendo um nome único e uma classe de armazenamento (Multi-Regional).
    Fazer upload e download de arquivos para o bucket.

O objetivo principal é você se familiarizar com a interface e os primeiros passos para armazenar objetos no Google Cloud Storage.

### compartilhando o projeto
Nesta aula, aprendemos sobre o controle de acesso a objetos dentro de um bucket no Google Cloud Storage.

Inicialmente, o acesso público a objetos é desabilitado por padrão. Para habilitá-lo, é necessário editar as permissões do objeto e adicionar "allUsers" com permissão de leitura.

Além disso, a aula explica como obter o endereço de um bucket e como acessar objetos diretamente através de URLs. É importante notar que, mesmo que um objeto tenha acesso público, o acesso a outros objetos ou ao próprio bucket pode ser negado, a menos que as permissões sejam explicitamente concedidas.

Por fim, a aula destaca a importância de ter cuidado ao conceder acesso público a um bucket inteiro, pois geralmente é preferível tornar apenas alguns objetos específicos públicos.

## Criando um site estático
### Registrando o domínio
Nesta aula, o instrutor Ricardo Merces ensina como criar e hospedar um site estático no Google Cloud Storage.

Primeiramente, ele explica que o Google Cloud Storage pode ser usado para hospedar sites estáticos, o que é uma alternativa mais barata do que manter uma máquina virtual rodando.

Em seguida, ele demonstra como registrar um domínio gratuito no site Freenom e como configurar o DNS para apontar para o Google Cloud Storage. Ele explica que é necessário criar um registro CNAME e um registro TXT para verificar o domínio no Google Webmaster Central.

Após a verificação do domínio, o instrutor menciona que no próximo vídeo irá mostrar como configurar o bucket no Google Cloud Storage para hospedar o site.

### Criando o bucket para o site
Nesta aula, aprendemos a criar um bucket no Google Cloud Storage (GCS) para hospedar um site estático, utilizando o "gsutil", uma ferramenta de linha de comando.

O processo envolve:

1. Criação do Bucket: Utilização do comando "mb gs://[nome do bucket]", onde o nome do bucket deve ser o mesmo do domínio registrado (FQDN - Fully Qualified Domain Name), como "www.rmerceslabs.tk".
2. Verificação do Domínio: O Google exige a verificação da propriedade do domínio antes de permitir a criação do bucket associado.
3. Upload do Conteúdo: Utilização do comando "cp -R * gs://[nome do bucket]" para copiar recursivamente todo o conteúdo do site para o bucket. O uso da flag "-R" garante que todos os arquivos e subdiretórios sejam copiados.
4. Correção de Permissões: Após o upload, é necessário configurar as permissões do bucket para permitir o acesso público ao site.

### Acessando o site
Nesta aula, o foco é configurar e acessar um site estático hospedado no Google Cloud Storage (GCS), abordando principalmente as questões de permissões e configuração do bucket para funcionar como um site.

Inicialmente, a aula aborda a correção de problemas de permissão que impedem o site de funcionar corretamente. É ensinado como usar o comando "gsutil acl" para configurar as permissões do bucket, tornando-o público ao conceder permissão de leitura para "AllUsers".

Além disso, a aula explica como configurar o bucket para que ele se comporte como um site, utilizando o comando "gsutil web set" para definir a página inicial (index.html) e a página de erro (404.html).

A aula também destaca a importância de aplicar as permissões de forma recursiva ("-R") para garantir que todos os objetos dentro do bucket também sejam públicos.

Por fim, a aula demonstra como atualizar o conteúdo do site de forma eficiente usando o comando "gsutil rsync", que sincroniza apenas as diferenças entre os arquivos locais e os arquivos no bucket, otimizando o processo de atualização.

### Consolidando o conhecimento
Chegou a hora de você seguir todos os passos realizados por mim durante esta aula:

- Caso você ainda não tenha um domínio, pode registrar um no Freenom
- No seu domínio, crie um registro do tipo CNAME, com nome www e apontando para c.storage.googleapis.com
- Acesse a Webmaster Central da Google
    Clique em Add Property, insira o seu domínio e clique em Continue
    Na aba Alternate methods, selecione Domain name provider e Other em seguida (caso seu domínio esteja registrado no Freenom. Copie o texto que será exibido
- Volte ao Freenom e, no seu domínio, crie um registro do tipo TXT, apontando para o texto copiado acima
- Volte à Webmaster Central da Google e clique em Verify
- Através do console, criar um bucket que vai se referenciar ao seu site, por exemplo:

```
gsutil mb gs://www.rmerceslabs.tk
```

Em seguida, copie os arquivos do site (caso você não tenha baixado, baixe-o aqui) para dentro do bucket, por exemplo:

```
gsutil -m cp -R * gs://www.rmerceslabs.tk
```

Adicione a permissão de leitura para o bucket e todos os seus arquivos:

```
gsutil acl ch -R -u AllUsers:R gs://www.rmerceslabs.tk
```

Configure o bucket para ele se comportar como um site, dizendo qual é a página inicial e a de erro:

```
gsutil web set -m index.html -e 404.html gs://www.rmerceslabs.tk
```

Caso você faça alguma mudança no site, pode enviar as alterações para o bucket com o seguinte comando:

``` 
gsutil -m rsync . gs://www.rmerceslabs.tk
```

Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

## Ajustando as permissões
### Permissionamento colaborativo
Nesta aula, o instrutor ensina como configurar permissões colaborativas em buckets do Google Cloud Storage (GCS) para diferentes usuários, simulando um cenário de empresa com prestadores de serviço.

Primeiro, ele cria três buckets, um para cada empresa (SpaceX, Blue Origin e uma terceira). Em seguida, demonstra como definir permissões de acesso a um bucket (SpaceX) para dois usuários com perfis diferentes: um desenvolvedor (com permissões de administrador) e um beta tester (com permissão de visualizador).

O instrutor mostra como adicionar membros e atribuir roles (admin e viewer) diretamente na console do Google Cloud. Ele explica a diferença entre Access Control Lists (ACLs) e Identity and Access Management (IAM), recomendando o uso do IAM para configurar permissões em buckets, pois o IAM aplica as permissões a todo o bucket e seus objetos, enquanto as ACLs são aplicadas por objeto.

Por fim, o instrutor demonstra como listar as permissões configuradas via ACLs e IAM usando o gsutil, mostrando a diferença na saída e reforçando a recomendação de usar IAM para o gerenciamento de permissões em buckets. Ele menciona que na próxima aula irá mostrar como fazer o mesmo permissionamento utilizando o gsutil.

### Configurando as roles com o gsutil
Nesta aula, o instrutor demonstra como aplicar políticas de permissão em projetos do Google Cloud Storage (GCS) usando a ferramenta de linha de comando gsutil. Ele começa comparando as políticas de permissão entre dois projetos ("001spacex" e "002-blueorigin") e, em seguida, mostra como editar um arquivo JSON para adicionar membros (usuários) com roles específicas (administrador e viewer) no projeto "blueorigin".

O instrutor explica como usar o comando gsutil iam set para aplicar as permissões definidas no arquivo JSON ao bucket do projeto. Ele também mostra como verificar as permissões aplicadas usando o comando gsutil iam get e na interface do Google Cloud Console.

Além disso, o instrutor realiza testes práticos para verificar se as permissões estão funcionando corretamente, abrindo outro navegador logado como um usuário específico e tentando acessar e manipular objetos no bucket. Ele também demonstra como copiar um objeto para o bucket com um usuário e tentar excluí-lo com outro usuário, verificando se as permissões estão sendo aplicadas conforme o esperado.

Por fim, o instrutor levanta a questão de se é possível adicionar vários usuários de uma vez ou se existem outras formas de adicionar usuários além de adicionar um por um.

### Grupos e domínios
Nesta aula, o instrutor explica como adicionar diferentes tipos de membros (usuários, contas de serviço, domínios e grupos) a um bucket no Google Cloud Storage, mostrando como gerenciar permissões de forma mais flexível.

Ele demonstra como adicionar um grupo do Google Groups e um domínio G-Suite ao bucket, atribuindo a eles roles específicas (como "Visualizador de objetos" e "Administrador", respectivamente).

O objetivo é mostrar que você pode gerenciar permissões de acesso aos seus buckets de várias maneiras, facilitando a colaboração em projetos.

### Consolidando o seu conhecimento


Chegou a hora de você seguir todos os passos realizados por mim durante esta aula:

- Criar três buckets, para representar três empresas
- Na Google Cloud Platform, em Browser, no bucket da primeira empresa, configure um membro como Storage Object Admin e outro membro como Storage Object Viewer
    - Em seguida, teste o premissionamento desses membros
- Através do console, no bucket da segunda empresa, configure um membro como Storage Object Admin e outro membro como Storage Object Viewer
    - Em seguida, teste o premissionamento desses membros
- Através do console, no bucket da terceira empresa, configure um grupo do Google Groups como Storage Object Viewer
    - Em seguida, teste o premissionamento dos membros do grupo

Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.


## Ciclo de vida dos projetos

## Entendendo o versionamento

## Transferindo dados