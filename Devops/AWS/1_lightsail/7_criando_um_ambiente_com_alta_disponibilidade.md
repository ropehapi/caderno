<div class="formattedText" data-external-links="">
                                <p>Terminada a criação da instância Ubuntu-2, ela estará em execução. Na tela inicial da Lightsail, seu status será "<em>Running</em>".</p>
<p>Na aula anterior, paramos a instância Ubuntu-1. Vamos clicar nos três pontos no canto superior direito dela e selecionar "<em>Start</em>". Ela provavelmente terá um novo IP, pois não providenciamos um IP estático para ela.</p>
<p>Para evitar problemas futuramente, vamos <strong>alocar IPs dedicados</strong> para essas duas máquinas. Clicaremos nos três pontos no canto superior direito de Ubuntu-2 e selecionaremos "<em>Manage</em>". Em seguida, acessaremos a aba "<em>Networking</em>" e clicaremos em "<em>Create static IP</em>", como fizemos anteriormente. Atribuiremos o nome "Staticip-ubuntu2" e pressionaremos o botão "<em>Create</em>" ao final da página.</p>
<p>Na sequência, repetiremos o processo com a instância Ubuntu-1, atribuindo o nome "Staticip-ubuntu2" ao novo IP estático.</p>
<p>Apesar de Ubuntu-2 ser oriunda de um <em>snapshot</em>, ela possui um IPv6 por padrão, pois esse <em>setup</em> já está fora do escopo da instância. Essa informação consta no canto inferior direito da instância, logo acima do texto "Virginia Zone B". No meu caso, o IPv6 é <code>2600:1f18:2431:e901:4d05:c4ce:43e2:a86c</code>.</p>
<p>Como pretendemos trabalhar com alta disponibilidade, queremos que as instâncias sejam iguais, então vamos ajustar essa questão do IPv6. Em Ubuntu-2, vamos clicar nos três pontos e selecionar "<em>Manage</em>". Acessaremos a aba "<em>Networking</em>" e, no tópico "<em>IPv6 networking</em>", vamos desabilitar o IPv6. Agora, as máquinas estão iguais.</p>
<h2>Identificadores</h2>
<p>Temos duas instâncias em execução, vamos nos conectar à primeira. No terminal, abriremos a pasta em que fizemos o download da chave SSH e rodaremos o seguinte comando, com o IP de Ubuntu-1:</p>
<pre class="prettyprint"><code class="hljs language-css">ssh -<span class="hljs-selector-tag">i</span> lightsail-rmerces<span class="hljs-selector-class">.pem</span> ubuntu<span class="hljs-keyword">@52</span>.202.109.71</code><button type="button" class="clipit">Copiar código</button></pre><p>Anteriormente, instalamos o Nginx nessa máquina. Para checar, vamos navegar até o diretório <code>html</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> /var/www/html/</code><button type="button" class="clipit">Copiar código</button></pre><p>Ao rodar um <code>ls</code> nesse diretório, encontraremos o arquivo <code>index.nginx-debian.html</code>. O Nginx está devidamente instalado.</p>
<p>O <em>load balancer</em> será responsável por distribuir o tráfego entre os servidores, mas como sabemos o que foi entregue à primeira instância e o que foi entregue à segunda instância? Como solução, vamos gerar um <strong>identificador</strong>.</p>
<p>No diretório <code>html</code>, criaremos um arquivo <code>server.txt</code> e nele escreveremos "SERVIDOR UBUNTU - 1":</p>
<pre class="prettyprint"><code class="hljs language-undefined">sudo vi server.txt</code><button type="button" class="clipit">Copiar código</button></pre><blockquote>
<p>SERVIDOR UBUNTU - 1</p>
</blockquote>
<p>Optamos por um <code>.txt</code>, mas poderia ser um <code>.html</code> também. Trata-se apenas de uma maneira de identificar o servidor. Uma vez criado, para consultar seu conteúdo, basta rodar o seguinte comando no terminal:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cat</span> server.txt</code><button type="button" class="clipit">Copiar código</button></pre><p>E espera-se que o retorno seja:</p>
<blockquote>
<p>SERVIDOR UBUNTU - 1</p>
</blockquote>
<p>Então, vamos validar. Em uma nova guia do navegador, tentaremos acessar o IP da instância Ubuntu-1, adicionando <code>/server.txt</code> ao endereço.</p>
<p>Não vamos obter sucesso, porque, entre esta aula e a anterior, nós reiniciamos a máquina e nos esquecemos de ligar o serviço. Para automatizar o carregamento no <em>reboot</em> da máquina, vamos executar o seguinte comando:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo systemctl <span class="hljs-built_in">enable</span> nginx</code><button type="button" class="clipit">Copiar código</button></pre><p>Em seguida, para ligá-lo:</p>
<pre class="prettyprint"><code class="hljs language-sql">sudo service nginx <span class="hljs-keyword">start</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Caso ainda não consiga acessar o IP da instância com <code>/server.txt</code> no navegador, certifique-se de que você não apagou a <strong><em>regra da porta 80 do firewall</em></strong>! Para checar, vamos à interface da Lightsail. Clicaremos nos três pontos na instância Ubuntu-1, selecionaremos "<em>Manage</em>" e acessaremos a aba "<em>Networking</em>". Sob o tópico "<em>IPv4 Firewall</em>", temos a seguinte tabela:</p>
<table><thead><tr><th><strong>Application</strong></th><th><strong>Protocol</strong></th><th><strong>Port or range / Code</strong></th><th><strong>Restricted to</strong></th></tr></thead><tbody><tr><td>SSH</td><td>TCP</td><td>22</td><td>Any IPv4 address / Lightsail browser SSH/RDP</td></tr><tr><td>HTTP</td><td>TCP</td><td>80</td><td>Any IPv4 address</td></tr></tbody></table>
<p>Caso a porta 80 não conste na sua tabela, basta adicioná-la, clicando em "<em>Add rule</em>" no canto esquerdo superior da tabela.</p>
<p>Agora, no navegador, ao acessar o IP da instância e adicionar <code>/server.txt</code> ao final do endereço, o resultado será o texto "SERVIDOR UBUNTU - 1".</p>
<p>Assim, concluímos ser importante atentar às regras de <em>firewall</em>, checar se o serviço está efetivamente no ar e nos certificar de que ele é carregado no <em>reboot</em> da máquina. Do contrário, ao reiniciar a instância (por exemplo, para manutenção), o serviço não estará disponível.</p>
<p>Por fim, repetiremos todo o processo na segunda instância. Primeiramente, vamos verificar as regras do <em>firewall</em>. Clicaremos nos três pontos no canto direito superior da instância Ubuntu-2 e selecionaremos "<em>Manage</em>". Em seguida, acessaremos a aba "<em>Networking</em>" para consultar a tabela sob o tópico "<em>IPv4 Firewall</em>":</p>
<table><thead><tr><th><strong>Application</strong></th><th><strong>Protocol</strong></th><th><strong>Port or range / Code</strong></th><th><strong>Restricted to</strong></th></tr></thead><tbody><tr><td>SSH</td><td>TCP</td><td>22</td><td>Any IPv4 address / Lightsail browser SSH/RDP</td></tr><tr><td>HTTP</td><td>TCP</td><td>80</td><td>Any IPv4 address</td></tr></tbody></table>
<p>Como comentamos anteriormente, as portas 22 e 80 vêm liberadas por padrão. Assim como o IPv6, essa configuração também está fora do escopo da instância.</p>
<p>No terminal, vamos executar <code>exit</code> para sair da primeira máquina. Depois, acessaremos a outra instância, usando o IP de Ubuntu-2:</p>
<pre class="prettyprint"><code class="hljs language-css">ssh -<span class="hljs-selector-tag">i</span> lightsail-rmerces<span class="hljs-selector-class">.pem</span> ubuntu<span class="hljs-keyword">@44</span>.196.25.85</code><button type="button" class="clipit">Copiar código</button></pre><p>Vamos navegar até o diretório <code>html</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> /var/www/html/</code><button type="button" class="clipit">Copiar código</button></pre><p>Depois, criaremos o documento <code>servidor.txt</code>:</p>
<pre class="prettyprint"><code class="hljs language-undefined">sudo vi server.txt</code><button type="button" class="clipit">Copiar código</button></pre><p>Nesse arquivo, escreveremos o seguinte texto:</p>
<blockquote>
<p>SERVIDOR UBUNTU - 2</p>
</blockquote>
<p>Para verificar que o conteúdo de <code>servidor.txt</code> foi salvo corretamente, podemos executar o seguinte comando:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cat</span> servidor.txt</code><button type="button" class="clipit">Copiar código</button></pre><p>E o retorno deverá ser:</p>
<blockquote>
<p>SERVIDOR UBUNTU - 2</p>
</blockquote>
<p>Na sequência, faremos o mesmo teste que realizamos com a instância anterior. No navegador, acessaremos o IP de Ubuntu-2 e adicionaremos <code>/server.txt</code> ao endereço. Como resultado, temos o texto "SERVIDOR UBUNTU - 2". Tudo está funcionando como esperado!</p>
<p>No próximo vídeo, habilitaremos o <em>load balancer</em> e descobriremos como ele está fazendo a distribuição entre nossas duas instâncias. Dessa forma, construímos um ambiente com alta disponibilidade de maneira rápida e fácil.</p>
                        </div>