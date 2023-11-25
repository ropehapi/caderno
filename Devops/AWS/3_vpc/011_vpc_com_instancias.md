<div class="formattedText" data-external-links="">
                                <p>Já excluí as instâncias que usamos anteriormente. Agora, vamos criar duas instâncias — uma na sub-rede pública e outra na sub-rede privada.</p>
<h2>Nova instância: servidor</h2>
<p>No console da AWS, no painel da EC2, vamos acessar a seção "Instâncias &gt; Instâncias" na lateral esquerda da tela. Em seguida, clicaremos no botão "Executar instâncias" à direita.</p>
<p>Primeiramente, criaremos uma máquina para representar um servidor web, selecionando as seguintes configurações:</p>
<blockquote>
<ul><li><strong>Nome:</strong> maquina-web</li><li><strong>Imagem de máquina:</strong> Amazon Linux (64 bits)</li><li><strong>Tipo de instância:</strong> t2.micro</li><li><strong>Par de chaves:</strong> aws-ohio</li></ul>
</blockquote>
<p>Na seção "Configurações de rede", vamos clicar no botão "Editar", no canto direito superior. No campo "VPC", selecionaremos a "infra-vpc" (que aparecerá na lista com seu ID) Agora, no campo "Sub-rede", temos disponíveis apenas as sub-redes dessa VPC. Vamos selecionar a sub-rede pública.</p>
<p>Na opção "Atribuir IP público automaticamente", vamos selecionar "Habilitar". Assim, o IP público será criado automaticamente via HDCP, como fizemos anteriormente.</p>
<p>Se deixássemos essa opção desabilitada, poderíamos configurar o IP depois. Inclusive, no curso de EC2, aprendemos a fazer isso com o <em>elastic IP</em> para ter um IP estático definido. Essa seção ficará da seguinte forma:</p>
<blockquote>
<ul><li><strong>VPC:</strong> infra-vpc</li><li><strong>Sub-rede:</strong> infra-subnet-public1-us-east-2c</li><li><strong>Atribuir IP público automaticamente:</strong> Habilitar</li></ul>
</blockquote>
<p>A seguir, vamos para a seção "Firewall (grupos de segurança)". Um grupo de segurança está anexado à VPC. Como criamos outra VPC, não podemos utilizar o grupo de segurança SSH que criamos anteriormente — ele sequer existirá entre as opções.</p>
<p>Após marcar a opção "Selecionar grupo de segurança existente", teremos o campo "Grupos de segurança comuns" com a lista de grupos. No caso, temos apenas o grupo "default". Ao criar uma VPC, um grupo de segurança padrão é criado automaticamente para permitir todo o acesso entre máquinas e sub-redes dessa VPC.</p>
<p>Por enquanto, não vamos usar o grupo padrão. Em vez de selecionar o grupo de segurança existente, vamos criar um grupo de segurança. Tanto o nome quando a descrição será a palavra "vazio" e não teremos nenhuma regra — basta clicar no botão "Remover" à direita para excluir a regras existentes:</p>
<blockquote>
<ul><li><strong>Firewall:</strong> Criar grupo de segurança</li><li><strong>Nome do grupo de segurança:</strong> vazio</li><li><strong>Descrição:</strong> vazio</li><li><strong>Regras do grupo de segurança de entrada:</strong> sem regras</li></ul>
</blockquote>
<p>Mais adiante, vamos alterar esses grupos de segurança e configurar suas permissões em detalhes. Não vamos alterar mais nada nesta página. Ao final da tela, clicaremos no botão "Executar instância".</p>
<h2>Nova instância: banco de dados</h2>
<p>Na sequência, vamos criar outra máquina para representar o banco de dados, que não precisa ser acessada pela internet. Voltando à listagem de instâncias no painel da EC2, vamos clicar no botão "Executar instâncias" novamente e preencher os campos da seguinte maneira:</p>
<blockquote>
<ul><li><strong>Nome:</strong> maquina-bd</li><li><strong>Imagem de máquina:</strong> Amazon Linux (64 bits)</li><li><strong>Tipo de instância:</strong> t2.micro</li><li><strong>Par de chaves:</strong> aws-ohio</li></ul>
</blockquote>
<p>Na seção "Configurações de rede", vamos clicar no botão "Editar", no canto superior direito. Em seguida, selecionaremos a "infra-vpc" e a sub-rede privada. Dessa vez, não vamos atribuir um IP público automaticamente, porque ele não teria um caminho na rede para checar à nossa sub-rede, dado que não está configurado com o <em>internet gateway</em>:</p>
<blockquote>
<ul><li><strong>VPC:</strong> infra-vpc</li><li><strong>Sub-rede:</strong> infra-subnet-private1-us-east-2c</li><li><strong>Atribuir IP público automaticamente:</strong> Desabilitar</li></ul>
</blockquote>
<p>Na seção "Firewall (grupo de segurança)", selecionaremos um grupo de segurança existente: o "vazio" que criamos há pouco:</p>
<blockquote>
<ul><li><strong>Firewall:</strong> Selecionar grupo de segurança existente</li><li><strong>Grupo de segurança:</strong> vazio</li></ul>
</blockquote>
<p>Por fim, clicaremos no botão "Executar instância" ao final da página.</p>
<p>Agora, temos uma instância que pode ser acessada pela internet e outra que não pode, pois elas estão em sub-redes diferentes.</p>
<h2>Permissões</h2>
<p>Vamos voltar à listagem de instâncias no painel da EC2 e clicar no ID da instância "maquina-web", para configurar suas permissões. No menu superior, vamos selecionar "Ações &gt; Segurança &gt; Alterar grupos de segurança".</p>
<p>Nesta página, há um campo onde poderíamos adicionar um  grupo de segurança. Porém, antes, é necessário criá-lo. Então, no menu lateral, vamos acessar a seção "Rede e segurança &gt; Security groups". Em seguida, clicaremos no botão "Criar grupo de segurança", no canto superior direito.</p>
<p>Vamos nomeá-la "ssh-publico", pois será um SSH que permite a entrada de qualquer lugar. Na descrição, vamos apenas escrever "ssh-publico". Em "VPC", selecionaremos a "infra-vpc" (que aparecerá com seu ID):</p>
<blockquote>
<ul><li><strong>Nome:</strong> ssh-publico</li><li><strong>Descrição:</strong> ssh-publico</li><li><strong>VPC:</strong> infra-vpc</li></ul>
</blockquote>
<p>Na seção "Regras de entrada", vamos clicar no botão "Adicionar regra" e preencher os campos da seguinte forma (note que alguns dos campos não são editáveis):</p>
<blockquote>
<ul><li><strong>Tipo:</strong> SSH</li><li><strong>Protocolo:</strong> TCP</li><li><strong>Intervalo de portas:</strong> 22</li><li><strong>Tipo de origem:</strong> Qualquer porta-IPv4</li></ul>
</blockquote>
<p>Assim, as instâncias que tiver este grupo de segurança permitirá a entrada SSH de qualquer lugar. Não precisamos alterar nada nas seções "Regras de saída" e "Tags". Ao final da página, clicaremos no botão "Criar grupo".</p>
<p>Criado o grupo, vamos voltar para a listagem de instâncias e clicar no ID de "maquina-web" novamente. Em seguida, selecionaremos "Ações &gt; Segurança &gt; Alterar grupos de segurança".</p>
<p>No campo de adição, selecionaremos o grupo "ssh-publico" que acabamos de criar e clicar no "Adicionar grupo de segurança" à direita. Mais abaixo, temos a lista dos grupos de segurança associados à interface de rede, onde constam "vazio" e "ssh-publico". No canto inferior direito, pressionaremos o botão "Salvar".</p>
<h2>Acesso</h2>
<p>Para tentar acessar a "maquina-web", vamos clicar no botão "Conectar" no topo da tela. Depois, na aba "Cliente SSH", copiaremos o comando de exemplo que aparece na parte inferior da página, que será parecido com o seguinte:</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh <span class="hljs-operator">-</span>i "aws-ohio.pem" ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@ec2</span><span class="hljs-number">-18</span><span class="hljs-number">-224</span><span class="hljs-number">-179</span><span class="hljs-number">-96.</span>us<span class="hljs-operator">-</span>east<span class="hljs-number">-2.</span>compute.amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Ao executar esse comando no terminal, conseguiremos acessar a "maquina-web" sem problemas. Vamos sair dela, utilizando o comando <code>exit</code>.</p>
<p>Na sequência, vamos tentar acessar a "maquina-bd". Na listagem de instâncias, clicaremos em seu ID e pressionaremos o botão "Conectar". Na aba "Cliente SSH", ao final da página, há um comando semelhante ao seguinte:</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh <span class="hljs-operator">-</span>i "aws-ohio.pem" ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@10</span><span class="hljs-number">.0</span><span class="hljs-number">.130</span><span class="hljs-number">.4</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Trata-se do comando para realizar a conexão com o IP privado, já que não atribuímos nenhum IP público a esta máquina. Nem adianta testarmos, pois não conseguiremos nos conectar. Esta instância não está acessível para o mundo.</p>
<p>Para fazê-la funcionar, vamos adicionar a chave "aws-ohio.pem" ao agente SSH. Assim, quando fizermos um SSH, o sistema usará essa chave, se possível. Basta executar o seguinte comando no terminal:</p>
<pre class="prettyprint"><code class="hljs language-bash">ssh-add ./aws-ohio.pem</code><button type="button" class="clipit">Copiar código</button></pre><p>Como teste, vamos acessar a "maquina-web" novamente. Dessa vez, não precisamos mais informar a chave. O comando ficará semelhante ao seguinte:</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@ec2</span><span class="hljs-number">-18</span><span class="hljs-number">-224</span><span class="hljs-number">-179</span><span class="hljs-number">-96.</span>us<span class="hljs-operator">-</span>east<span class="hljs-number">-2.</span>compute.amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Conseguimos acessar também! Podemos sair com o comando <code>exit</code>. A seguir, vamos realizar o acesso inserindo o parâmetro <code>-A</code> para adicionar o agente SSH à conexão:</p>
<pre class="prettyprint"><code class="hljs language-css">ssh -<span class="hljs-selector-tag">A</span> ec2-user<span class="hljs-keyword">@ec2-18-224-179-96</span>.us-east-2.compute.amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>O acesso continua funcionando! Dentro de "maquina-web", vamos tentar acessar nossa máquina de banco de dados. Como já adicionamos o agente SSH, podemos executar o comando sem a chave:</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@10</span><span class="hljs-number">.0</span><span class="hljs-number">.130</span><span class="hljs-number">.4</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Ao tentar acessar, não obtemos resposta, porque não temos um grupo de segurança.</p>
<p>No próximo vídeo, criaremos um novo grupo de segurança que permite acesso à máquina de banco de dados somente a partir de "maquina-web". Sabemos que o acesso global (vindo da internet) já não é possível, mas queremos limitar ainda mais. Assim a "maquina-bd" acessará apenas "maquina-web" e não qualquer máquina da sub-rede pública ou privada, por exemplo.</p>
                        </div>