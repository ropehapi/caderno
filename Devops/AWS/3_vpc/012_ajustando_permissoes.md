<div class="formattedText" data-external-links="">
                                <p>Neste vídeo, vamos criar um grupo de segurança na nossa VPC. Ele permitirá o acesso somente vindo de "maquina-web".</p>
<h2>Novo grupo de segurança</h2>
<p>Na listagem de instâncias, vamos clicar no ID de "maquina-web" e copiar o endereço IPv4 privado. No meu caso, é <code>10.0.12.136</code>.</p>
<p>No menu à esquerda, acessaremos "Rede e segurança &gt; Security groups" e clicar no botão "Criar grupo de segurança", no canto superior direito:</p>
<blockquote>
<ul><li><strong>Nome:</strong> ssh-web-bd</li><li><strong>Descrição:</strong> ssh-web-bd</li><li><strong>VPC:</strong> infra-vpc</li></ul>
</blockquote>
<p>Na seção "Regras de entrada", clicaremos no botão "Adicionar regra" e inserir a seguinte regra:</p>
<blockquote>
<ul><li><strong>Tipo:</strong> SSH</li><li><strong>Protocolo:</strong> TCP</li><li><strong>Intervalo de portas:</strong> 22</li><li><strong>Tipo de origem:</strong> Personalizado</li><li><strong>Origem:</strong> 10.0.12.136/32</li></ul>
</blockquote>
<p>No campo "Origem", definimos um CIDR, que é o IP da "maquina-web" com a máscara. Dessa forma, estamos permitindo acesso de "maquina-web" para "maquina-bd". Ou seja, podemos ter <strong>regras comuns mais restritas</strong>, o que aumenta a segurança.</p>
<p>Na seção "Regras de saída", como não temos acesso à internet, vamos remover a regra. Basta clicar no botão "Excluir" no canto superior direito dessa seção.</p>
<p>Ao final da página, clicaremos no botão "Criar grupo". Uma vez criado, vamos voltar à listagem de instâncias e clicar no ID de "maquina-bd". Depois, selecionares "Ações &gt; Segurança &gt; Alterar grupos de segurança".</p>
<p>No campo de adição, selecionaremos "ssh-web-bd" e clicaremos no botão "Adicionar grupo de segurança" à direita. Logo abaixo, temos a lista de grupos de segurança associados à interface de rede, onde consta "vazio" e "ssh-web-bd". No canto inferior direito, clicaremos em "Salvar".</p>
<h2>Acesso</h2>
<p>No terminal, conectados à "maquina-web", vamos tentar acessar a máquina de banco de dados:</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@10</span><span class="hljs-number">.0</span><span class="hljs-number">.130</span><span class="hljs-number">.4</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Em seguida, digitaremos "yes" e conseguiremos acessar a máquina! Assim, primeiro temos o IP da máquina web (10.0.12.136) e depois temos o IP da máquina de banco de dados (10.0.130.4). Ou seja, a partir de "maquina-web" conseguimos acessar a "maquina-bd".</p>
<p>Vale lembrar que não é possível acessar a máquina de banco de dados a partir da internet. É preciso entrar na rede de alguma forma e somente a partir da máquina web conseguiremos fazer um SSH para a máquina de banco de dados.</p>
<p>Estudamos bastante sobre a parte de infraestrutura, segurança, limitação de acesso, redes públicas e privadas. Também comentamos rapidamente sobre NAT, internet <em>gateway</em> e tabelas de roteamento. Nas próximas aulas, vamos nos aprofundar nesses conceitos de roteamento e redes na AWS!</p>
                        </div>