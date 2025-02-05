# Keycloak? Que p#### é essa?
Nesse módulo trataremos sobre o keycloak, um serviço de autenticação e segurança para aplicações e microsserviços, porém antes
de falarmos mais sobre O KEYCLOAK, vamos precisar explicar alguns dos alicerces que fundamentam o funcionamento
dessa ferramenta, como o OAuth 2.0 e o Open ID Connect.

## O que é OAuth 2.0
O OAuth 2.0 é um protocolo de autorização que permite que aplicativos obtenham acesso limitado a recursos
protegidos em nome do proprietário do recurso, sem a necessidade de compartilhar as credenciais de acesso. 
A estrutura do OAuth 2.0 é composta por quatro atores principais, que integragem entre si para obter autorização e acesso 
a recursos protegidos.

- **Proprietário do recurso**: o usuário ou sistema que possui os recursos protegidos e pode conceder acesso a eles.
- **Cliente**: o cliente é o sistema que requer acesso aos recursos protegidos. Para acessar recursos, o Cliente deve ter o token de acesso apropriado.
- **Servidor de autorização**: este servidor recebe solicitações do Cliente para tokens de acesso e os emite mediante autenticação e consentimento bem-sucedidos do proprietário do recurso. O servidor de autorização expõe dois endpoints: o endpoint de Autorização, que lida com a autenticação e o consentimento interativos do usuário, e o endpoint de Token, que está envolvido em uma interação máquina a máquina.
- **Servidor de recursos**: um servidor que protege os recursos do usuário e recebe solicitações de acesso do Cliente. Ele aceita e valida um token de acesso do cliente e retorna os recursos apropriados para ele.

### Como o OAuth 2.0 funciona?
No nível mais básico, antes que o OAuth 2.0 possa ser usado, o Cliente deve adquirir suas próprias credenciais, uma id do cliente e um client secret, do servidor de autorização para se identificar e autenticar ao solicitar um token de acesso.
Usando o OAuth 2.0, as solicitações de acesso são iniciadas pelo Cliente, por exemplo, um aplicativo móvel, site, aplicativo de TV inteligente, aplicativo de desktop, etc. A solicitação, a troca e a resposta do token seguem este fluxo geral:

1- O Cliente solicita autorização (solicitação de autorização) do servidor de Autorização, fornecendo a ID e o segredo do cliente como identificação; ele também fornece os escopos e um URI de endpoint (URI de redirecionamento) para enviar o token de acesso ou o código de autorização.

2- O servidor de Autorização autentica o Cliente e verifica se os escopos solicitados são permitidos.

3- O proprietário do recurso interage com o servidor de autorização para conceder acesso.

4- O servidor de autorização é redirecionado de volta para o cliente com um código de autorização ou token de acesso, dependendo do tipo de concessão, como será explicado na próxima seção. Um token de atualização também pode ser retornado. 
Com o token de acesso, o cliente solicita acesso ao recurso a partir do servidor de recursos.

## O que é o Open Id Connect?

O OpenID Connect ou OIDC é um protocolo de identidade que utiliza os mecanismos de autorização e autenticação do OAuth 2.0. A especificação final do OIDC foi publicada em 26 de fevereiro de 2014 e agora é amplamente adotada por muitos provedores de serviços de identificação na Internet.

O OIDC foi desenvolvido pela OpenID Foundation, que inclui empresas como Google e Microsoft. Enquanto o OAuth 2.0 é um protocolo de autorização, o OIDC é um protocolo de autenticação de identidade e pode ser usado para verificar a identidade de um usuário para um serviço cliente, também chamada Parte Confiável. Além disso, as claims dos usuários, como, por exemplo, nome, endereço de e-mail, etc., também podem ser compartilhadas mediante solicitação.

Uma ampla variedade de clientes pode usar o OpenID Connect (OIDC) para identificar usuários, de aplicativos de página única (SPA) a aplicativos nativos e móveis. Também pode ser usado para login único (SSO) em todos os aplicativos. O OIDC usa JSON Web Tokens (JWT) e fluxos HTTP e evita o compartilhamento de credenciais do usuário com serviços.

O OpenID Connect tem consentimento integrado. Isso é importante, pois o OIDC é usado com frequência em serviços voltados para o consumidor (por exemplo, uma Parte Confiável), onde o compartilhamento de dados pessoais requer o consentimento explícito do usuário.

Esses recursos, juntamente com a simplicidade de implementação, tornam o OpenID Connect um protocolo útil quando a identidade de um usuário é necessária, e uma alternativa poderosa ao SAML 2.0 mais complexo. Também é especialmente adequado para aplicativos móveis.

## O que é o keycloak?
Patrocinado pela Red Hat, o Keycloak é um software open source de um servidor JBoss feito para trabalhar em conjunto com sua aplicação em implementações mais comuns de autenticação e de autorização.

Caso as configurações padrão não te atendam, existem várias configurações e customizações que podem ser feitas para adequar o funcionamento ao seu sistema.

### O que o Keycloak oferece?
São oferecidas, pelo Keycloak, funcionalidades como:

- Criação de usuário (podendo ser criados pelo administrador do sistema e habilitado ou não para o próprio usuário se cadastrar)
- Login, “esqueci minha senha” e login com plataformas externas como redes sociais
- Integração dos usuários com Active Directory
- Ativação de usuários por confirmação de e-mail
- Necessidade de aceitação de termos de uso antes de logar
- Customização das páginas que o usuário acessa (como a própria tela de login)
- Serviços para que outras aplicações busquem dados de usuários
- Criação de permissões que o sistema vai usar
- Criação de grupos de usuário
- i18n (internationalization)
- Entre outras várias configurações e customizações mais avançadas!
