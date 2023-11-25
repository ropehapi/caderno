<div class="formattedText" data-external-links="">
                                <p>Agora vamos aprender a operar pela <em>AWS CLI</em>, a linha de comando do <em>Amazon Web Services</em>.</p>
<p>Vamos pesquisar "aws cli install" no <em>Google</em> e clicar no primeiro link. Essa é a página da documentação que ensina a instalar a <em>AWS CLI</em>. Há instruções para cada um dos sistemas operacionais.</p>
<p>No <em>Windows</em>, basta baixar o instalador no link ou rodar o comando no seu terminal.</p>
<p>No <em>macOS</em>, também há as opções de instalador e de linha de comando.</p>
<p>No <em>Linux</em>, basta executar os três comandos presentes na documentação. É isso que o instrutor fará.</p>
<p>É importante que tenhamos pelo menos a versão 2.7.29 da <em>AWS CLI</em>. Podemos verificar isso executando o comando <code>aws --version</code>:</p>
<pre class="prettyprint"><code class="hljs language-css">aws <span class="hljs-attr">--version</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Temos a <em>AWS CLI</em> instalada, mas ainda não podemos utilizá-la. Precisamos fazer a configuração, rodando o comando <code>aws configure</code>. Ao fazer isso, o terminal nos solicitará a "AWS Access Key". </p>
<p>Vamos voltar ao <em>Dashboard</em> da <em>AWS</em>. Um dos serviços exibidos nessa página é o <em>IAM</em>. Essa é uma interface que controla o acesso aos recurso da nossa conta, e nós vamos abri-la. </p>
<blockquote>
<p>Obs:
É importante que o usuário raiz da conta tenha autenticação multifatores (<em>MFA</em>). Sua segurança precisa ser redobrada.</p>
</blockquote>
<p>Vamos criar outro usuário, acessando "Gerenciamento de acesso &gt; Usuários". Vamos clicar em "Adicionar usuários", porque não utilizaremos a <em>CLI</em> como usuário raiz. Vamos criar outro usuário gerenciável.</p>
<p>O nome do usuário será "teste". Em seguida, escolheremos o tipo de credencial. No caso, selecionaremos "Chave de acesso: acesso programático". Vamos avançar à próxima página, onde gerenciaremos permissões.</p>
<p>Como só temos um usuário, selecionaremos a opção "Anexar políticas existentes de forma direta". Adicionaremos a política "AdministratorAccess", que concede acesso de administrador. Poderíamos adicionar tags, mas não faremos isso. Avançaremos para a revisão.</p>
<p>Chegou a hora de clicar em "Criar usuário". Ao fazer isso, receberemos o <em>ID</em> da chave de acesso. Vamos copiá-lo, pois precisamos levá-lo ao terminal, que há pouco nos solicitou essa informação.</p>
<p>Agora, o terminal solicita a "AWS Secret Acess Key", que está ao lado do ID  da chave de acesso no navegador. Basta copiá-la e levá-la para o terminal.</p>
<p>Vamos adicionar outra configurações. Vamos definir a "Default region name" em "us-east-1", que é o padrão, "Default output format" também será o padrão. Agora nossa <em>AWS</em> está configurada. Se executarmos o comando <code>aws help</code>, veremos o que podemos fazer:</p>
<pre class="prettyprint"><code class="hljs language-bash">aws <span class="hljs-built_in">help</span></code><button type="button" class="clipit">Copiar código</button></pre><p>No próximo vídeo, vamos conhecer alguns dos comandos que podemos executar na <em>EC2</em>.</p>
                        </div>