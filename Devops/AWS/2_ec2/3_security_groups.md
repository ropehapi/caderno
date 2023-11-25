<div class="formattedText" data-external-links="">
                                <p>No último vídeo, relembramos alguns conceitos e os colocamos em prática. </p>
<p>Agora vamos relembrar o assunto de <em>security groups</em>. </p>
<p>Através das nossas máquinas, nos conectamos ao servidor remoto. Vamos nos desconectar com o comando <code>exit</code>.</p>
<p>No menu à esquerda da <em>AWS</em>, vamos descer até "Rede e segurança &gt; Security groups". Quando criamos nossa conta, ela recebe um grupo por padrão, o "default". Depois de clicar em qualquer lugar da sua linha, podemos rolar a página para baixo e ver detalhes.</p>
<p>Dentre as abas do grupo, há a aba "Regras de entrada": ela informa que todo o tráfego está liberado para todos os usuários. Logo, o <em>security group</em> padrão libera por completo o acesso à sua rede.</p>
<p>Se acessarmos a aba "Regra de saída", veremos que a mesma coisa também está acontecendo. </p>
<p>Há outro <em>Security group</em>, o "launch-wizard-1", que também é criado por padrão, quando criamos nossa instância. Se clicarmos nele e acessarmos a aba "Regras de entrada", veremos uma regra diferente: ele só libera o acesso que utilize <em>SSH</em>, mas de qualquer origem.</p>
<p>Podemos alterar essas definições. Vamos permitir apenas o acesso à nossa máquina. Para isso, vamos em "Editar regras de entrada". Vamos apagar "0.0.0.0/0", o código que libera o acesso geral. Vamos selecionar, na seção "Origem", a caixa de seleção para "Meu IP".</p>
<p>Com isso, a <em>Amazon</em> identificará nosso <em>IP</em> público e somente ele poderá acessar essa máquina através de <em>SSH</em>. Para identificar melhor mais à frente, vamos adicionar "acesso ssh" à descrição. Depois, vamos salvar a regra.</p>
<p>De volta ao terminal, vamos executar o comando <code>ssh -i</code>, somado a chave da <em>Amazon</em> que baixamos e as informações de acesso. No caso do instrutor, foi:</p>
<pre class="prettyprint"><code class="hljs language-sql">ssd <span class="hljs-operator">-</span>i "ec2.pem" ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@ec2</span><span class="hljs-number">-3</span><span class="hljs-number">-87</span><span class="hljs-number">-44</span><span class="hljs-number">-144.</span>compute<span class="hljs-number">-1.</span>amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Quando tentamos acessar, tudo continua funcionando. Agora vamos testar outra alteração, para impedir a liberação da entrada. Vamos clicar novamente em "Editar regras de entrada".</p>
<p>A partir disso, vamos copiar nosso <em>IP</em> público, removê-lo e, no seu lugar, colar o <em>IP</em> novamente, mas alterando um de seus números, para que seja um <em>IP</em> semelhante ao nosso, mas diferente. No caso do instrutor, ele substituiu "50" por "51", antes da barra inclinada à direita.</p>
<p>Vamos salvar a nova regra. Agora esse outro <em>IP</em> poderia acessar nossa máquina, enquanto o nosso, não.</p>
<p>De volta ao terminal, vamos executar o último comando novamente. Não receberemos resposta do servidor, porque nosso <em>IP</em> não está mais autorizado a acessá-lo. </p>
<p>Vamos voltar o security group "launch-wizard-1" e clicar em "Editar regras de entrada". Vamos apagar o <em>IP</em> fictício e inserir o <em>IP</em> da nossa máquina outra vez. Depois, salvaremos as regras e voltaremos ao nosso terminal, que ainda tenta se conectar.</p>
<p>Vamos interromper isso com "Ctrl + C" e tentar acessar novamente. Como nosso <em>IP</em> voltou a ser liberado, conseguiremos acessar.</p>
<blockquote>
<p>Obs:
Os grupos de segurança funcionam como o "firewall" da <em>AWS</em>, bloqueando e permitindo acesso de entrada e de saída da instância.</p>
</blockquote>
<p>Não precisamos, porém, de um <em>security group</em> para cada instância. Podemos clicar em "Criar grupo de segurança", chamá-lo de "acesso-web" e descrever sua função na caixa de texto abaixo de "Descrição": "Libera acesso a porta 80 e 443 para acesso <em>HTTP</em> e <em>HTTPS</em>".</p>
<p>O grupo estará atrelado a uma <em>VPC</em>, vamos manter o padrão. Depois, na seção "Regras de entrada", clicaremos em "Adicionar regra". Em tipo, selecionaremos "HTTP". Em "Origem", "Personalizado"= e adicionaremos <code>0.0.0.0/0,::/0</code>. Com isso, liberamos o acesso de <em>IPv4</em> e <em>IPv6</em>.</p>
<p>Faremos o mesmo processo, adicionando outra regra. Dessa vez, para liberar o acesso <em>HTTPS</em>.</p>
<p>Depois, criaremos o grupo de segurança. Nós criamos um grupo de regras que podem adicionadas à nossa instância.</p>
<p>Adicionaremos acessando "Instâncias &gt; Instâncias &gt; ec2-first &gt; Ações &gt; Segurança &gt; Alterar grupos de segurança". Lá, em "Grupos de segurança associados", vamos adicionar "acesso-web", o grupo que acabamos de criar.</p>
<p>Depois que salvarmos, ele será permitido. </p>
<p>Na próxima aula, continuaremos gerenciando instâncias.</p>
                        </div>