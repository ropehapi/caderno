<div class="formattedText" data-external-links="">
                                <p>Falamos um pouco sobre <em>Internet Gateway</em> e <em>NAT Gateway</em> para entender as diferenças entre eles. </p>
<blockquote>
<p><strong>Observação:</strong> No final deste vídeo aprenderemos a definir um <em>gateway</em> NAT, mesmo com a possibilidade de ter custos financeiros.</p>
</blockquote>
<p>Queremos tornar pública a nossa rede privada. Queremos criar uma rota da sub-rede para o <em>Internet Gateway</em> sempre que tentarmos realizar algum processo. </p>
<p>Começaremos buscando o link "Gateways da Internet", na página do Painel da VPC. Clicando nele, iremos para a página de mesmo nome, onde veremos dois <em>gateways</em>: um da nossa VPC padrão e abaixo dele outro da "infra-igw" que criamos, onde "ig" significa <em>internet gateway</em>.</p>
<p>Nesse "infra-igw", estamos conectados à nossa sub-rede pública até este ponto. Na tela, temos uma coluna exibindo o ID da VPC. </p>
<p>Não temos muitas informações para analisar. Se clicarmos no ID localizado na coluna "ID do gateway da internet", iremos para uma página que exibe, a seção "Detalhes", e abaixo dela a seção "<em>Tags</em>", onde temos um campo de busca denominado "Pesquisar tags".</p>
<p>Não existem muitas configurações para fazermos neste cenário: o IP será definido em outro lugar. O local em que estamos abre as portas da internet para nós e as portas da sub-rede para a internet.</p>
<p>É possível observar como realizar a ligação entre a sub-rede e o <em>Internet Gateway</em>. Isso é feito através de uma tabela de rotas. Vamos acessá-la por meio do explorador lateral. Dentro do menu "Nuvem privada virtual", clicaremos no submenu "Tabela de rotas".</p>
<p><strong>Como funciona uma tabela de rotas?</strong> Se trata de uma lista de regras solicitando que, se determinado endereço for acessado, haverá um <strong><em>redirecionamento</em></strong> para determinado lugar.</p>
<p>Configuraremos os acessos para serem redirecionados ao <em>Internet Gateway</em>, pois a partir da internet ele encontrará o seu caminho.</p>
<p>Na tela que acabamos de abrir, veremos uma tabela de rotas com a nossas redes. Entre elas, encontramos a nossa rede pública: <code>infra-rtb-public</code>, onde <code>rtb</code> significa <em>route table</em>. </p>
<p><strong>Dica:</strong> Os nomes são bastante importantes para identificar a função de cada elemento.</p>
<p>Se clicarmos no ID da <code>infra-rtb-public</code>, seremos direcionados para uma nova página onde temos as seções "Detalhes" e "Rotas". Acessando esta última, veremos a coluna "Destino", alinhada à esquerda.</p>
<p>Ao tentar acessar qualquer coisa na minha própria rede, <strong><em>o alvo é local</em></strong>, ou seja, não seremos redirecionados. Podemos ver o alvo na coluna "Alvo", à direita de "Destino". No caso do destino "10.0.0.0/16", o alvo "local" é exibido.</p>
<p>Contudo, se tentarmos acessar qualquer outra coisa, iremos para o gateway. Para o destino "0.0.0.0/0", o alvo "igw-03fdb4648007bee2d" é exibido.</p>
<p>Adicionaremos a nova rota <code>0.0.0.0/0</code> à tabela de rotas da rede privada. Podemos fazer isso de duas formas.</p>
<h3>Adicionando uma rota</h3>
<p>Voltando à página da tabela de rotas, clicaremos no ID <code>rtb-03ec942ea30ce21bf</code> referente à rede privada <code>infra-rtb-private1-us-east-2c</code>. </p>
<p>Na nova página, desceremos até a seção "Rotas" e clicaremos no botão "Editar rotas", alinhado à direita no nome da seção. Em seguida, clicaremos no botão "Adicionar rota", no canto inferior, alinhado à esquerda.</p>
<p>Contudo <strong><em>não seguiremos este método</em></strong>, pois criaremos uma nova tabela para fins de prática.</p>
<h3>Criando uma nova tabela de rotas</h3>
<p>Voltando à página da tabela de rotas, clicaremos no botão "Criar tabela de rotas", localizado no canto direito e acima da tabela de rotas existente. Seremos redirecionados para a página da seção "Criar tabela de rotas". </p>
<p>Abaixo deste título há a seção "Configurações da tabela de rotas", onde encontramos um campo editável. Nele escreveremos o nome da tabela:</p>
<pre class="prettyprint"><code class="hljs language-undefined">minha-tabela-de-rota-privada-para-igw</code><button type="button" class="clipit">Copiar código</button></pre><p>Abaixo deste campo, há a seção "VPC" com um botão de lista suspensa, no qual selecionaremos a opção que representa a rede que criamos e com a qual estamos trabalhando — a <code>infra-vpc</code>.</p>
<pre class="prettyprint"><code class="hljs language-scss">vpc-<span class="hljs-number">0615</span>fc55438a59826 (infra-vpc)</code><button type="button" class="clipit">Copiar código</button></pre><p>Abaixo da seção "Configurações da tabela de rotas", temos outra intitulada "Tags", na qual podemos adicionar <em>tags</em> ou não. Neste caso, vamos pular essa parte.</p>
<p>Abaixo de "Tags", por sua vez, temos o botão "Criar tabela de rotas". Clicaremos nele, criando assim a nova tabela. Em seguida, seremos direcionados de volta à página da tabela de rotas.</p>
<p>Na seção "Rotas" podemos editar as rotas, clicando no botão "Editar rotas", alinhado à direita. Na página "Editar rotas", clicaremos no botão "Adicionar rota". Neste momento, surgirão os campos editáveis "Destino" e "Alvo".</p>
<p>No campo "Destino", adicionaremos a rota "0.0.0.0/0". Em "Alvo", escolheremos a opção "Gateway da Internet" selecionando em seguida a única rede dessa VPC, e portanto, aquela que será utilizada: "igw-03fdb4648007bee2d". Clicaremos no botão de salvar alterações e pronto.</p>
<p>Desta forma, ao tentar acessar qualquer coisa, vamos mandar este acesso ao <em>Gateway</em> da Internet.</p>
<p>Ainda nas configurações da tabela de rotas atual, clicaremos no submenu "Associações de sub-rede", localizado entre as seções "Detalhes" e "Rotas".</p>
<p>Repare que esta tabela de rotas não está associada à nenhuma sub-rede — nós a criamos na VPC, mas ainda não a estamos utilizando.</p>
<p>Na seção "Associações de sub-rede", clicaremos em "Editar associações de sub-rede" e clicaremos no checkbox da nossa sub-rede privada, adicionando-a à nossa tabela.</p>
<p>Se lembrarmos do desenho da criação de VPC, veremos que adicionamos uma ligação, ou uma linha, entre a minha sub-rede privada e o <em>Internet Gateway</em>. Dessa maneira, a nossa sub-rede privada passa a ser pública também.</p>
<p>Vamos testar duas coisas: primeiro, acessaremos o terminal que está conectado à sub-rede privada. Nele, tentaremos realizar um <code>ping</code> para o google.</p>
<pre class="prettyprint"><code class="hljs language-undefined">ping google.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Veremos que já estará funcionando, pois o <code>ping</code> será efetuado com sucesso.</p>
<p>Vamos cancelar este processo e inserir o comando que rodamos mais cedo:</p>
<pre class="prettyprint"><code class="hljs language-sql">sudo yum <span class="hljs-keyword">update</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Ele também funcionará e buscará os detalhes, nos mostrando que não há nenhum pacote para atualizar.</p>
<p>Digitaremos <code>exit</code> e daremos "Enter" para sair da sub-rede privada, voltando assim para a <code>maquina-web</code>.</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">exit</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Daremos outro <code>exit</code> para sair da <code>maquina-web</code> também.</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">exit</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Tentaremos acessar diretamente a <code>maquina-bd</code> a partir da nossa máquina. Para isso, voltaremos ao navegador, onde acessaremos a página "Painel da VPC". Nela, digitaremos "EC2" no campo de busca e entraremos novamente na página do EC2.</p>
<p>Lembraremos o endereço da nossa máquina clicando no link "instâncias". Na nova página, clicaremos no ID de instância da <code>maquina-bd</code>, depois em "Conectar", e copiaremos o comando de conexão.</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh <span class="hljs-operator">-</span>i "aws-ohio-pem." ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@ec2</span><span class="hljs-number">-3</span><span class="hljs-number">-14</span><span class="hljs-number">-95</span><span class="hljs-number">-226.</span>us<span class="hljs-operator">-</span>east<span class="hljs-number">-2.</span>compute.amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Voltaremos ao terminal, colaremos o comando e pressionaremos "Enter". Veremos que ainda não será possível conseguir o acesso. A partir da nossa máquina, conseguimos sair, mas não conseguimos entrar novamente.</p>
<p>Isso ocorre pois temos aquela configuração na nossa ACL. Estamos permitindo a saída mas só permitimos a entrada a partir da nossa sub-rede pública.</p>
<p>Poderíamos liberar o tráfego de outros lugares, retornando ao "Painel da VPC" no navegador e acessando o submenu "ACLs da rede" por meio do explorador lateral. Nele, acessaríamos a <code>redes-ab</code> que corresponde à ACL onde configuramos a regra.</p>
<p>No nosso caso, vamos manter dessa forma, sem liberar outros acessos. Com o <em>Internet Gateway</em> liberamos a sub-rede para que ela possa acessar a internet.</p>
<p><strong>Reforçando:</strong> Esta rede se tornou pública, portanto existe para o mundo externo e é acessível pela internet. Entretanto, a nossa ACL está barrando o tráfego, como se fosse um "<em>firewall</em>" realizando o bloqueio.</p>
<p>Se não quiséssemos esse bloqueio, teríamos que criar um <em>Gateway NAT</em>. Vamos ver como faríamos isso.</p>
<h3>Criando um Gateway NAT</h3>
<p>No explorador lateral, selecionaremos o submenu "Gateways NAT". O campo "Nome - opcional" recebe o nome do novo <em>gateway</em>. Já o campo "Sub-rede" possui uma lista suspensa, na qual deverá ser selecionada a nossa rede pública <code>subnet-06681d058414c5533 (infra-subnet-public1-us-east-2c)</code>.</p>
<p>Dessa forma, o <em>gateway</em> terá acesso à internet.</p>
<p>Depois, no topo da página, buscaremos o caminho de menus "VPC &gt; Gateways NAT &gt; Criar gateway NAT", onde clicaremos em "VPC" para voltarmos ao "Painel da VPC".</p>
<p>No corpo da página, clicaremos em "Tabela de rotas". Selecionando a tabela de rotas já existente da nossa sub-rede privada, ou mesmo aquela que acabamos de criar, adicionaríamos a rota enviando-a para o NAT ao invés de enviá-la ao <em>Internet Gateway</em>.</p>
<p>Dessa forma, não existiria acesso para dentro da rede, mas sim para fora dela.</p>
<p>Como visto, podemos realizar a mesma tarefa de diversas formas.</p>
<p>Vamos remover o <em>Internet Gateway</em> da sub-rede, clicando novamente em "Associações de sub-rede". Na seção "Associações explícitas de sub-rede", clicaremos em "Editar associações de sub-rede". Em seguida removeremos o check na nossa rede <code>infra-subnet-private1-us-east-2c</code> e salvaremos as alterações, removendo essa rede da tabela.</p>
<p>No topo da página, buscaremos novamente o caminho de submenus, onde clicaremos em "Tabelas de rotas" para acessar essa página. Na seção de mesmo nome, clicaremos no <em>checkbox</em> à esquerda da tabela <code>minha-tabela-de-rota-privada-para-igw</code>, pois não queremos que a rede privada se torne pública.</p>
<p>Com o checkbox selecionado, clicaremos em "Ações &gt; Excluir tabela de rotas". Em seguida, precisamos digitar "excluir" no campo solicitado e clicar no botão no canto inferior direito para confirmar a operação.</p>
<p>Agora a nossa sub-rede voltou a ser privada. Com isso, não conseguimos mais acessá-la diretamente — só a partir da <code>maquina-web</code>.</p>
<p>Entendemos a diferença entre <em>Internet Gateway</em> e <em>NAT Gateway</em>, aprendemos a criar uma tabela de rotas para os dois tipos de <em>gateway</em>.</p>
<p>Traremos mais um detalhe: vamos imaginar que queremos acessar um <em>bucket</em> ou um arquivo no S3 através da nossa rede privada ou mesmo da pública.</p>
<p>O método da Amazon permite que acessemos esse <em>bucket</em> de dentro da nossa VPC através da internet. Ou seja, saímos da nossa rede, batemos na internet e depois voltamos para dentro do <em>bucket</em> ou de qualquer outro serviço da AWS.</p>
<p>Para evitar esse processo, <strong><em>criaremos uma conexão entre as nossas sub-redes e algum serviço</em></strong>. Neste caso, será um <em>bucket</em> S3, que é bem simples de configurar.</p>
<p>Esta conexão permitirá o acesso a estes serviços de forma interna à partir da nossa rede privada e poupará recursos da nossa rede pública, que não precisará mais passar pela internet.</p>
<p>No próximo vídeo, veremos como criar esta conexão.</p>
                        </div>