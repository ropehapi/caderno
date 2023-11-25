<div class="formattedText" data-external-links="">
                                <p>Concluído do <em>deploy</em>, o status aparecerá como "<em>Active</em>" no final da página, sob o tópico "<em>Deployment versions</em>":</p>
<table><thead><tr><th><strong>Date</strong></th><th><strong>Version</strong></th><th><strong>Status</strong></th></tr></thead><tbody><tr><td>September 9, 2022 - 3:19 PM</td><td>1</td><td>Active</td></tr></tbody></table>
<p>No topo da página, encontraremos a referência do <em>public domain</em>. Vamos clicar nela para acessá-la em uma nova guia do navegador.</p>
<p>O resultado será uma página com o texto "TESTE SITE". Assim, fizemos o <em>deploy</em> e o <em>setup</em> criou um serviço para expor o contêiner na porta 80. Já temos um ambiente preparado para gerenciar contêineres.</p>
<h2>Versões</h2>
<p>A seguir, vamos testar como são feitas as versões. No terminal, vamos entrar na pasta <code>src</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> src</code></pre><p>Abriremos o <code>index.html</code>:</p>
<pre class="prettyprint"><code class="hljs language-undefined">vi index.html</code></pre><p>Em seguida, modificaremos o título <code>&lt;h1&gt;</code> de "TESTE SITE" para "TESTE SITE 2" e salvar:</p>
<pre class="prettyprint"><code class="hljs language-xml"><span class="hljs-meta">&lt;!DOCTYPE <span class="hljs-keyword">html</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">html</span> <span class="hljs-attr">lang</span>=<span class="hljs-string">"en"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">head</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">charset</span>=<span class="hljs-string">"UTF-8"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">http-equiv</span>=<span class="hljs-string">"X-UA-Compatible"</span> <span class="hljs-attr">content</span>=<span class="hljs-string">"IE=edge"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">name</span>=<span class="hljs-string">"viewport"</span> <span class="hljs-attr">content</span>=<span class="hljs-string">"width=device-width, initial-scale=1.0"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">title</span>&gt;</span>Rmerces LABS<span class="hljs-tag">&lt;/<span class="hljs-name">title</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">head</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">body</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">h1</span>&gt;</span>TESTE SITE 2<span class="hljs-tag">&lt;/<span class="hljs-name">h1</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">body</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">html</span>&gt;</span></code></pre><p>Voltaremos para a pasta raiz:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> ..</code></pre><p>Faremos o <em>build</em> novamente:</p>
<pre class="prettyprint"><code class="hljs language-undefined">docker build .</code></pre><p>Será gerado outro número da imagem, vamos tagueá-la:</p>
<pre class="prettyprint"><code class="hljs language-bash">docker tag 77520ee71924 rmerces/apache-labs</code></pre><p>Depois, vamos subir a imagem no repostiório:</p>
<pre class="prettyprint"><code class="hljs language-bash">docker push rmerces/apache-labs</code></pre><p>Uma vez atualizada no Docker Hub, vamos voltar à Lightsail. No tópico "<em>Deployment versions</em>", vamos clicar nos três pontos à direita da versão ativa e selecionar "<em>Modify and redeploy</em>". Para confirmar que desejamos criar um novo contêiner, pressionaremos "<em>Yes, continue</em>".</p>
<p>Não precisamos modificar nenhum dos campos, basta clicar em "<em>Save and deploy</em>" ao final do formulário. Após alguns instantes, sob o tópico "<em>Deployment versions</em>", agora temos duas versões.  A versão 1 está inativa e a versão 2 (a mais recente) está ativa:</p>
<table><thead><tr><th><strong>Date</strong></th><th><strong>Version</strong></th><th><strong>Status</strong></th></tr></thead><tbody><tr><td>September 9, 2022 - 3:27 PM</td><td>2</td><td>Active</td></tr><tr><td>September 9, 2022 - 3:19 PM</td><td>1</td><td>Inactive</td></tr></tbody></table>
<p>Para verificar se está realmente ativo, vamos atualizar a guia em que acessamos o <em>public domain</em> anteriormente, já que o endereço é o mesmo. Dessa vez, o resultado deve ser o texto "TESTE SITE 2".</p>
<p>O serviço da Lightsail está gerenciando nosso contêiner. Os contêineres são gravados como versões e, a qualquer momento, podemos fazer um <em>roll back</em> para voltar a versões anteriores. Por exemplo, poderíamos clicar nos três pontos à direita da versão 1, selecionar "<em>Modify and redeploy</em>", fazer quaisquer ajustes que quisermos e salvar.</p>
<p>Esse serviço de gerenciamento é bastante útil. Por vezes, são criados sistemas extremamente complexos e, com a Lightsail, podemos simplificar todos esses processos.</p>
<h2>Removendo recursos</h2>
<p>Por fim, vamos fazer a "faxina" para desmobilizar todas as alocações e não termos custos indesejados. Na tela inicial da Lightsail, acessaremos a aba "<em>Containers</em>". Vamos clicar nos três pontos no canto direito superior do contêiner apache-labs e selecionar "<em>Delete</em>". Para confirmar, pressionaremos "<em>Yes, delete</em>".</p>
<p>É interessante conferir todas as abas dessa tela inicial e nos certificar de que não sobraram recursos, assim não haverá cobranças.</p>
                        </div>