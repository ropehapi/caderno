<div class="formattedText" data-external-links="">
                                <p>Agora que já configuramos a <em>AWS</em> na nossa linha de comando, vamos descobrir o que podemos fazer.</p>
<p>No terminal, se digitarmos o comando <code>aws help</code>, encontraremos uma lista com todos os comando que podemos utilizar. Para que nos aprofundemos, porém, vamos acessar a documentação em <a href="https://docs.aws.amazon.com/cli/index.html" rel="nofollow noopener" target="_blank">https://docs.aws.amazon.com/cli/index.html</a>.</p>
<p>Acessando o guia do usuário, vamos buscar pelos comandos relacionados ao <em>EC2</em>. Vamos voltar ao consolee acessar nossa lista de instâncias. Quando removermos o filtro que mostra apenas as instâncias em execução, veremos que há cinco instâncias criadas.</p>
<p>Voltemos ao terminal. Se apertarmos a tecla "Q", sairemos das ajudas. Vamos executar o comando <code>aws ec2 describe-instances"</code>. Isso nos apresentará todas as instâncias. Para filtrarmos os campos que serão trazidos, podemos utilizar o parâmetro <code>--query="Reservations[*].Instances</code>. </p>
<pre class="prettyprint"><code class="hljs language-sql">aws ec2 <span class="hljs-keyword">describe</span><span class="hljs-operator">-</span>instances <span class="hljs-comment">--query="Reservations[*].Instances</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Assim, pegaremos apenas as instâncias.</p>
<p>Há também o parâmetro <code>--filter</code>. Para executá-lo, precisamos do nome do filtro, que pode ser encontrado com o comando <code>help</code>. Podemos verificar os comandos possíveis para as instâncias assim:</p>
<pre class="prettyprint"><code class="hljs language-bash">aws ec2 describe-instances <span class="hljs-built_in">help</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Vamos buscar pelos filtros, digitando <code>filters</code> na linha de comando. Depois que localizarmos o nome, vamos copiá-lo e usá-lo no comando abaixo:</p>
<pre class="prettyprint"><code class="hljs language-sql">aws ec2 <span class="hljs-keyword">describe</span><span class="hljs-operator">-</span>instances <span class="hljs-comment">--filters="Name=instance-state-name, Values=running"</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Vamos copiar apenas o <em>ID</em> da instância e adicioná-lo ao comando:</p>
<pre class="prettyprint"><code class="hljs language-graphql">aws ec2 describe-instances --filters<span class="hljs-punctuation">=</span><span class="hljs-string">"Name=instance-state-name, Values=running"</span> -<span class="hljs-keyword">query</span><span class="hljs-punctuation">=</span>Reservations<span class="hljs-punctuation">[</span>*<span class="hljs-punctuation">]</span>.Instances<span class="hljs-punctuation">[</span>*<span class="hljs-punctuation">]</span>.<span class="hljs-punctuation">[</span>InstanceId, State<span class="hljs-punctuation">]</span><span class="hljs-string">"</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Assim, trazemos apenas o <em>ID</em> da instância e o seu estado, as duas informações que, no caso, estão entre colchetes.</p>
<p>Vamos tentar derrubar uma das instâncias, para que outra seja criada automaticamente. No vídeo, o instrutor seleciona a instância "i-05249de62f1444f37". Vamos pará-la com a ajuda do comando <code>aws ec2 stop-instances help</code>. Assim, receberemos o tutorial de utilização desse comando.</p>
<p>Descobriremos que precisamos passar o parâmetro <code>--instance-ids</code> e adicionar o <em>ID</em>:</p>
<pre class="prettyprint"><code class="hljs language-css">aws ec2 stop-instances help
aws ec2 stop-instances <span class="hljs-attr">--instance-ids</span> <span class="hljs-selector-tag">i</span>-<span class="hljs-number">05249</span>de62f1444f37</code><button type="button" class="clipit">Copiar código</button></pre><p>A instância, depois disso, será derrubada. Tudo que fazemos pelo navegador, também conseguimos fazer via <em>CLI</em>.</p>
<p>Os comandos não são simples de digitar. Por isso, o ideal é que criemos scripts. Para adicionar nossa última ação ao <em>script</em>, vamos passar o comando abaixo:</p>
<pre class="prettyprint"><code class="hljs language-json"><span class="hljs-punctuation">[</span>
        <span class="hljs-punctuation">[</span>
                <span class="hljs-punctuation">[</span>
                        <span class="hljs-string">"i-093b00d8c84926149"</span><span class="hljs-punctuation">,</span>
                        <span class="hljs-punctuation">{</span>
                                <span class="hljs-attr">"Code"</span><span class="hljs-punctuation">:</span> <span class="hljs-number">16</span><span class="hljs-punctuation">,</span>
                                <span class="hljs-attr">"Name"</span><span class="hljs-punctuation">:</span> <span class="hljs-string">"running"</span>
                        <span class="hljs-punctuation">}</span>
                <span class="hljs-punctuation">[</span>
        <span class="hljs-punctuation">[</span>
<span class="hljs-punctuation">[</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Outra maneira de definir a saída em configurando o <em>output</em> como "table" via linha de comando. Para fazer isso, porém, precisaríamos ter apenas um objeto. No nosso caso, temos dois <code>InstanceId</code> e <code>state</code>. Basta remover algum dos dois.</p>
<p>É possível definir o formato via linha de comando. Para defini-lo em <em>yaml</em>, por exemplo, faríamos assim:</p>
<pre class="prettyprint"><code class="hljs language-graphql">aws ec2 describe-instances --filters<span class="hljs-punctuation">=</span><span class="hljs-string">"Name=instance-state-name, Values=running"</span> -<span class="hljs-keyword">query</span><span class="hljs-punctuation">=</span>Reservations<span class="hljs-punctuation">[</span>*<span class="hljs-punctuation">]</span>.Instances<span class="hljs-punctuation">[</span>*<span class="hljs-punctuation">]</span>.<span class="hljs-punctuation">[</span>InstanceId, State<span class="hljs-punctuation">]</span><span class="hljs-string">" --output yaml</span></code><button type="button" class="clipit">Copiar código</button></pre><blockquote>
<p>Obs:
Também é possível fazer tudo isso enviando chamadas para <em>APIs</em>.</p>
</blockquote>
                        </div>