<div class="formattedText" data-external-links="">
                                <p>Vamos ligar a máquina novamente, clicando em "Ações &gt; Iniciar instância". Quando fizemos isso, nosso <em>IP</em> e nosso <em>DNS</em> mudaram.</p>
<p>Precisamos resolver isso. De algum forma, precisamos criar um <em>IP</em> fixo para essa máquina.</p>
<blockquote>
<p>Obs:
Mesmo que você nunca desligue sua máquina, ela pode ter uma pane. Por isso, o ideal é alocar um <em>IP</em>.</p>
</blockquote>
<p>No menu da esquerda, vamos acessar a página "IPs elásticos", o serviço de registro de <em>IP</em> da <em>Amazon</em>. Vamos clicar em "Aloca endereço IP elástico". Deixaremos todas as opções no padrão e clicar, simplesmente, em "Alocar".</p>
<p>Com o <em>IP</em> alocado, podemos clicar no seu endereço e, em seguida, na opção "Associar endereço <em>IP</em> elástico". Vamos manter "Instância" selecionada em "Tipo de recurso". Vamos inserir nossa instância logo abaixo. Agora basta clicar em "Associar"</p>
<p>A partir de agora, o <em>IP</em> apresentando na tela será redirecionado à nossa instância. Podemos copiá-lo e tentar acessá-lo em uma nova aba. Teremos sucesso nisso.</p>
<p>O <em>IP</em> antigo não está mais associado à nossa instância. Porém, agora podemos desligar nossa máquina quantas vezes quisermos, porque o <em>IP</em> permanecerá o mesmo.</p>
<p>Como os <em>IPs</em> são separados das instâncias, eles também geram cobranças. Por isso, quando remover a instância, poderá ainda ser cobrado pelo <em>IP</em>. O endereço de <em>IP</em> só não é cobrado se estiver associado a uma instância em funcionamento. Caso a instância estiver parada ou o <em>IP</em> não estiver associado a uma instância, ele resultará em cobrança.</p>
<blockquote>
<p>Obs:
Se sua máquina tiver mais de um <em>IP</em> associado a ela, os <em>IPs</em> extras serão cobrados.</p>
</blockquote>
<p>Podemos ver todos os detalhes de precificação na documentação do <em>AWS EC2</em>.</p>
<p>Dessa forma, definimos um <em>IP</em> estático para a nossa instância.</p>
<p>No próximo vídeo, vamos manipular bancos de dados com <em>RDS</em>.</p>
                        </div>