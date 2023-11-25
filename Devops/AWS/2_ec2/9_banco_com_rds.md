<div class="formattedText" data-external-links="">
                                <p>Hoje, vamos relembrar os conceitos relacionados ao sistema de gerenciamento do banco de dados da <em>Amazon</em>, o <em>RDS</em>.</p>
<p>Vamos nos conectar à instância que criamos e instalar um banco de dados nela. Vamos abrir o terminal e dar início à conexão.</p>
<p>Como nossos sitema operacional é um <em>Debian</em>, o sistema gerenciador de pacotes é o <em>APT</em>. Podemos executar o comando <code>sudo apt update</code> para atualizar os pacotes com a ajuda do super usuário. Agora, vamos instalar o <em>PostgreSQL</em>, com o comando <code>sudo apt install postgresql</code>.</p>
<p>Agora já temos um banco de dados instalado. Podemos configurá-lo, expor a porta no <em>security group</em> e mais. Mas não vamos fazer isso. De volta à <em>AWS</em>, vamos selecionar a barra de pesquisa e digitar "RDS". Vamos abrir a página em uma nova aba.</p>
<p>Nessa página, veremos que a <em>Amazon</em> nos trará muitas vantagens no gerenciamento de bancos de dados. Ela consegue, por exemplo, implantar o banco em várias zonas de disponibilidade. Isso diminui a latência.</p>
<p>Descendo a página até a seção "Criar banco de dados", podemos restaurar um banco salvo anteriormente no <em>S3</em>, mas clicaremos em "Criar banco de dados", porque não temos nenhum salvo. Vamos começar o nosso do zero.</p>
<p>Na nova página, selecionaremos "Criação fácil" como o método de criação de banco de dados. Isso nos trará alguns padrões pré-configurados. Nosso tipo de mecanismo será o <em>PostgreSQL</em>. Não podemos esquecer de selecionar seu "Nível gratuito", logo abaixo.</p>
<p>O identificador da instância será o nome da máquina que será criada, "instancia-pgsql". O nome do usuário será "postgres" e criaremos, abaixo, nossa senha.</p>
<p>Vamos clicar em "Criar banco de dados" e subir nossa instância, que criará uma máquina, instalará servidor de banco de dados, o tornará mais acessível e otimizado.</p>
<p>Quando criamos o banco, podemos ver seus detalhes de conexão clicando em "View connection details". </p>
<blockquote>
<p>Obs:
Se você permitiu que a <em>AWS</em> criasse sua senha automaticamente, essa será a única oportunidade de ver sua senha. Portanto, nesse caso, não esqueça de anotá-la.</p>
</blockquote>
<p>Vamos clicar no nome da instância "instancia-pgsql" e dar uma olhada em seus detalhes. Vemos o quanto da CPU está sendo utilizado, quantas conexões temos, qual o mecanismo e mais. Há também informações de conexão, como o <em>Endpoint</em>, popularmente conhecido como host, e a porta.</p>
<p>Vamos tentar nos conectar ao <em>Endpoint</em> via terminal. Lá, vamos executar o comando <code>psql -U postgres -W -h</code> com o link do <em>Endpoint</em>. No caso do instrutor, o comando foi o seguinte:</p>
<pre class="prettyprint"><code class="hljs language-undefined">psql -U postgres -W -h instancia-pgsql.cbxev7kfqbeb.us-east-1.rds.amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Depois, o terminal solicitará nossa senha e tentará se conectar. Se voltarmos ao navegador, veremos que ainda não há conexões. Isso acontece porque não adicionamos o grupo de segurança à instância do <em>EC2</em>.</p>
<p>Para resolver isso, vamos acessar a instância e, em seguida, "Ações &gt; Segurança &gt; Alterar grupos de segurança". Na página, vamos adicionar o grupo <em>default</em>. Agora podemos salvar e acessar.</p>
<p>De volta ao terminal, teremos sucesso ao tentar novamente. Estamos dentro do banco de dados.</p>
<p>Conseguimos nos conectar no <em>PostgreSQL</em> através de uma instância. </p>
<p>Só poderemos fazer isso através dos serviços da Amazon que estiverem na região, fazendo parte da <em>VPC</em> e tiverem o grupo de segurança habilitado.</p>
<p>No próximo vídeo, vamos dar uma olhada em <em>load balancing</em>.</p>
                        </div>