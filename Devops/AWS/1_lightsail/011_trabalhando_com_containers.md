<div class="formattedText" data-external-links="">
                                <p>Agora, teremos a oportunidade de trabalhar com contêineres. Vale lembrar que cada aplicação terá uma demanda diferente: às vezes, precisaremos de máquina virtual; outras vezes, contêineres. O que importa é que saibamos lidar com as duas formas.</p>
<p>Além das tecnologias, é importantíssimo pesquisar os custos para verificarmos a viabilidade do nosso projeto. Por exemplo, anteriormente, reparamos que a instância mais barata custava $3,50 ao mês.</p>
<h2>Provisionando um contêiner</h2>
<p>Na tela inicial da Lightsail, vamos acessar a aba "<em>Containers</em>" e clicar no botão "<em>Create container service</em>". De início, vamos manter a região da Virgínia selecionada. O próximo passo diz respeito aos custos, o plano mais barato custa $7 por <em>node</em>. O preço é o dobro da instância, porém nesse provisionamento podemos ter vários contêiners. Além disso, os contêineres permitem uma maior agilidade que as VMs.</p>
<p>No tópico "<em>Choose your power</em>", vamos escolher as especificações do nosso <em>node</em>: Nano, $7 por <em>node</em>. Em seguida, podemos selecionar a quantidade de instâncias para fazer o gerenciamento automático do nosso contêiner. No caso, optaremos por 1.</p>
<p>Na sequência, configuraremos o <em>deploy</em>, clicando em "<em>Set up deployment</em>". Há alguns modelos de contêineres, mas vamos subir o nosso que já está customizado. Basta marcar a caixa "<em>Specify a custom deployment</em>".</p>
<p>No campo "<em>Container name</em>", colocaremos o nome "apache-labs". Trata-se de um Apache com uma mensagem de teste, apenas para carregar o servidor Web, rodando no contêiner para homologar nossa solução. No campo "<em>Image</em>", apontaremos diretamente para o <em>register</em>, onde está a imagem.</p>
<ul><li><strong><em>Container name:</em></strong> apache-labs</li><li><strong><em>Image:</em></strong> docker.io/rmerces/apache-labs</li></ul>
<h3>Recapitulando: Docker</h3>
<p>Em resumo, precisamos de uma imagem, que está no <em>register</em>. Assim, apontamos para o <em>register</em> e fazemos o <em>deploy</em>, de maneira descomplicada.</p>
<p>Como criamos essa imagem? No caso, já temos uma <a href="https://registry.hub.docker.com/r/rmerces/apache-labs" target="_blank" rel="nofollow noopener noreferrer">imagem pronta no DockerHub</a> e basta apontar para ela: <code>docker.io/rmerces/apache-labs</code>. Para nos aprofundar um pouco mais, vamos verificar a imagem, que está num projeto GitHub.</p>
<p>Acessando o <a href="https://github.com/alura-cursos/apache-labs" target="_blank" rel="nofollow noopener noreferrer">projeto no GitHub</a>, temos a seguinte estrutura de arquivos:</p>
<ul><li>src<ul><li>index.html</li></ul>
</li><li>Dockerfile</li><li>README.md</li></ul>
<p>No Dockerfile:</p>
<pre class="prettyprint"><code class="hljs language-vbnet"><span class="hljs-keyword">FROM</span> ubuntu:<span class="hljs-number">18.04</span>

RUN apt-<span class="hljs-keyword">get</span> update &amp;&amp; \
  apt-<span class="hljs-keyword">get</span> -y install apache2

RUN rm -rf /var/<span class="hljs-keyword">lib</span>/apt/lists/*

COPY src/ /var/www/html/

EXPOSE <span class="hljs-number">80</span>

CMD [<span class="hljs-string">"/usr/sbin/apache2ctl"</span>, <span class="hljs-string">"-D"</span>, <span class="hljs-string">"FOREGROUND"</span>]</code><button type="button" class="clipit">Copiar código</button></pre><p>Em suma, nós selecionamos o Ubuntu, fizemos <em>update</em> nos pacotes, instalamos o Apache, limpamos os dados desnecessários gerados pelo <code>apt</code>, copiamos o <code>src</code> para o nosso <code>html</code>, expomos a porta 80 (servidor Web) e inicializamos o Apache.</p>
<p>Já no <code>index.html</code>:</p>
<pre class="prettyprint"><code class="hljs language-xml"><span class="hljs-meta">&lt;!DOCTYPE <span class="hljs-keyword">html</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">html</span> <span class="hljs-attr">lang</span>=<span class="hljs-string">"en"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">head</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">charset</span>=<span class="hljs-string">"UTF-8"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">http-equiv</span>=<span class="hljs-string">"X-UA-Compatible"</span> <span class="hljs-attr">content</span>=<span class="hljs-string">"IE=edge"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">name</span>=<span class="hljs-string">"viewport"</span> <span class="hljs-attr">content</span>=<span class="hljs-string">"width=device-width, initial-scale=1.0"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">title</span>&gt;</span>Rmerces LABS<span class="hljs-tag">&lt;/<span class="hljs-name">title</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">head</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">body</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">h1</span>&gt;</span>TESTE SITE<span class="hljs-tag">&lt;/<span class="hljs-name">h1</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">body</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">html</span>&gt;</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Trata-se de uma página bem simples, com título "Rmerces LABS" e a mensagem "TESTE SITE". Para fazer ajustes nessa imagem, podemos clonar o repositório:</p>
<pre class="prettyprint"><code class="hljs language-bash">git <span class="hljs-built_in">clone</span> https://github.com/ricardomerces/apache-labs.git</code><button type="button" class="clipit">Copiar código</button></pre><p>Após fazer os ajuste desejados, vamos acessar a raiz do clone do repositório e buildar a imagem:</p>
<pre class="prettyprint"><code class="hljs language-undefined">docker build .</code><button type="button" class="clipit">Copiar código</button></pre><p>Ao final, teremos um número que corresponde à imagem que criamos. No meu caso, é 14f35de79667. Em seguida, precisamos taguear a imagem:</p>
<pre class="prettyprint"><code class="hljs language-bash">docker tag 14f35de79667 rmerces/apache-labs</code><button type="button" class="clipit">Copiar código</button></pre><p>Por fim, vamos subi-la para o <em>register</em>, com um <code>push</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash">docker push 14f35de79667 rmerces/apache-labs</code><button type="button" class="clipit">Copiar código</button></pre><p>Assim, teremos a imagem no DockerHub.</p>
<h3>De volta para a Lightsail</h3>
<p>Voltando ao provisionamento do nosso contêiner, já atribuímos um nome e vamos apontar para o <em>register</em>:</p>
<ul><li><strong><em>Container name:</em></strong> apache-labs</li><li><strong><em>Image:</em></strong> docker.io/rmerces/apache-labs</li></ul>
<p>No tópico "<em>Configuration</em>", vamos clicar em "<em>Add open ports</em>" para expor a porta 80:</p>
<ul><li><strong><em>Port:</em></strong> 80</li><li><strong><em>Protocol:</em></strong> HTTP</li></ul>
<p>No tópico "<em>Public Endpoints</em>", vamos selecionar "apache-labs". Assim, vinculamos nossa imagem à porta 80 que escolhemos há pouco.</p>
<p>No tópico "<em>Identify your service</em>", colocaremos "apache-labs". Ao final da página, temos o resumo das configurações com o custo. Podemos clicar no botão "<em>Create container service</em>". Precisaremos esperar um pouco pelo <em>deploy</em> do contêiner.</p>
                        </div>