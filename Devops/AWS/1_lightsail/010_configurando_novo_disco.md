<div class="formattedText" data-external-links="">
                                <p>Na tela inicial da Lightsail, ao acessar a aba "<em>Storage</em>", constam os dois seviços de armazenamento que criamos: o <em>bucket</em> e o disco. Nesta aula, vamos conectar o disco à instância e fazer a configuração dele.</p>
<p>Voltando à aba "<em>Instances</em>", vamos conectar à nossa instância, Ubuntu-2. Dessa vez, usaremos o cliente Web. Basta clicar no retângulo laranja no canto direito superior da máquina virtual.</p>
<p>Para anexar o disco à instância, seguiremos quatro etapas:</p>
<ol><li>Fazer com que o Linux reconheça o disco fisicamente</li><li>Particionar o disco</li><li>Formatar o disco, instalando o <em>file system</em></li><li>Montar o disco</li></ol>
<h2>Reconhecimento</h2>
<p>Para verificar os dispositivos que o Linux já reconheceu, executaremos o seguinte comando:</p>
<pre class="prettyprint"><code class="hljs language-undefined">sudo sfdisk -l</code></pre><p>Analisando o retorno na console, encontramos o <code>Disk /dev/xvda</code> de 20 GB — o próprio disco de <em>boot</em> da instância:</p>
<table><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Disk /dev/xvda</strong></td><td><strong>20 GiB, 21474836480 bytes, 41943040 sectors</strong></td></tr><tr><td><strong>Units</strong></td><td>sectors of 1* 512 = 512 bytes</td></tr><tr><td><strong>Sector size (logical/physical)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>I/O (minumum/optimal)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>Disk label type</strong></td><td>dos</td></tr><tr><td><strong>Disk identifier</strong></td><td>0x15e6b846</td></tr></tbody></table>
<p>Também temos o disco que criamos na aula anterior. Conforme a referência do <strong><em>disk path</em></strong> que anotamos no final do último vídeo, encontramos o <code>Disk dev/xvdf</code>:</p>
<table><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Disk /dev/xvda</strong></td><td>8 GiB, 8589934592 bytes, 16777216 sectors</td></tr><tr><td><strong>Units</strong></td><td>sectors of 1* 512 = 512 bytes</td></tr><tr><td><strong>Sector size (logical/physical)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>I/O (minumum/optimal)</strong></td><td>512 bytes / 512 bytes</td></tr></tbody></table>
<p>Em seguida, para checar informações sobre as <strong>partições do sistema</strong>, rodaremos o seguinte comando:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">df</span> -h</code></pre><p>Como retorno, temos uma tabela. Na primeira linha, consta o disco que está montado (<em>root</em> corresponde ao <code>xvda</code>):</p>
<table><thead><tr><th><strong>Filesystem</strong></th><th><strong>Size</strong></th><th><strong>Used</strong></th><th><strong>Avail</strong></th><th><strong>Use%</strong></th><th><strong>Mounted on</strong></th></tr></thead><tbody><tr><td>/dev/root</td><td>20G</td><td>1.9G</td><td>18G</td><td>10%</td><td>/</td></tr></tbody></table>
<p>Entretanto, o disco <code>xvdf</code> não aparece na tabela. Ele foi reconhecido, porém não está montado, não está pronto para uso.</p>
<h2>Partições</h2>
<p>Para criar partições e preparar nosso disco <code>xvdf</code>, vamos executar o comando <code>fdisk</code> e apontá-lo para nosso dispositivo:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo fdisk /dev/xvfd</code></pre><p>Para consultar todas as opções de comando, podemos usar o comando <code>m</code>. De início, vamos rodar o comando <code>p</code> para imprimir a tabela da partição:</p>
<table><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Disk /dev/xvda</strong></td><td>8 GiB, 8589934592 bytes, 16777216 sectors</td></tr><tr><td><strong>Units</strong></td><td>sectors of 1* 512 = 512 bytes</td></tr><tr><td><strong>Sector size (logical/physical)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>I/O (minumum/optimal)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>Disk label type</strong></td><td>dos</td></tr><tr><td><strong>Disk identifier</strong></td><td>0xcf2aa5c1</td></tr></tbody></table>
<p>Não temos partições nesse disco. Para criar, rodaremos o comando <code>n</code>. Em seguida, para definir uma partição primária, rodamos <code>p</code>. Para determinar o número da partição, apenas pressionaremos a tecla "Enter", pois é a primeira partição. Para especificar o setor do disco, também pressionaremos "Enter". Para alocar todo o espaço da partição, também pressionaremos "Enter":</p>
<blockquote>
<p>Created a new partition 1 of type 'Linux' and of size 8 GiB</p>
</blockquote>
<p>Caso nossa intenção fosse criar várias partições, poderíamos alocar apenas 2 GB, depois criar outra partição com o comando <code>n</code> e alocar 3 GB, e assim sucessivamente. No caso, criamos apenas uma com o tamanho total.</p>
<p>Desse modo, criamos uma partição. Vamos rodar o comando <code>p</code> para imprimir a tabela novamente:</p>
<table><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Disk /dev/xvda</strong></td><td>8 GiB, 8589934592 bytes, 16777216 sectors</td></tr><tr><td><strong>Units</strong></td><td>sectors of 1* 512 = 512 bytes</td></tr><tr><td><strong>Sector size (logical/physical)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>I/O (minumum/optimal)</strong></td><td>512 bytes / 512 bytes</td></tr><tr><td><strong>Disk label type</strong></td><td>dos</td></tr><tr><td><strong>Disk identifier</strong></td><td>0xcf2aa5c1</td></tr></tbody></table>
<table><thead><tr><th><strong>Device</strong></th><th><strong>Boot Start</strong></th><th><strong>End</strong></th><th><strong>Sectors</strong></th><th><strong>Size</strong></th><th><strong>Id</strong></th><th><strong>Type</strong></th></tr></thead><tbody><tr><td>/dev/xvdf1</td><td>2048</td><td>16777215</td><td>16775168</td><td>8G</td><td>83</td><td>Linux</td></tr></tbody></table>
<p>Para gravar na tabela de partição, basta executar o comando <code>w</code>. O disco está devidamente particionado. Para nos certificar de tudo ocorreu como esperado, podemos repetir o comando:</p>
<pre class="prettyprint"><code class="hljs language-undefined">sudo fdisk -l</code></pre><p>Dessa vez, encontraremos o disco <code>xvdf</code> e também a partição criada.</p>
<h2>Formatação</h2>
<p>Uma vez criada a partição, vamos instalar o <em>file system</em> nela. Optaremos pelo <em>file system</em> padrão do Linux, o <code>ext4</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo mkfs.ext4 /dev/xvdf1</code></pre><h2>Montagem</h2>
<p>Temos o disco reconhecido, particionado e formatado, com o <em>file system</em> instalado. A última etapa é montar o disco.</p>
<p>Podemos montar o disco onde quisermos, mas optaremos pelo diretório <code>/mnt</code> para manter a organização:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> /mnt</code></pre><p>Vamos criar um diretório com o nome do nosso disco ("data"). Este será o nosso <strong>ponto de montagem</strong>:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo <span class="hljs-built_in">mkdir</span> data</code></pre><p>Depois, executaremos o comando <code>mount</code>, indicando o dispositivo e o ponto de montagem:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo mount /dev/xvdf1 /mnt/data/</code></pre><p>Para verificar se o disco foi devidamente montado, vamos consultar as partições do sistema novamente:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">df</span> -h</code></pre><p>Dessa vez, o disco <code>xvdf</code> também constará na tabela, na última linha:</p>
<table><thead><tr><th><strong>Filesystem</strong></th><th><strong>Size</strong></th><th><strong>Used</strong></th><th><strong>Avail</strong></th><th><strong>Use%</strong></th><th><strong>Mounted on</strong></th></tr></thead><tbody><tr><td>/dev/root</td><td>20G</td><td>1.9G</td><td>18G</td><td>10%</td><td>/</td></tr><tr><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td></tr><tr><td>/dev/xvdf1</td><td>7.9G</td><td>36M</td><td>4G</td><td>1%</td><td>/mnt/data</td></tr></tbody></table>
<p>Agora, nossa instância dispõe desse segundo disco.</p>
<p>O último ajuste que falta é automatizar todo esse processo. Se reiniciarmos a máquina, perderemos o ponto de montagem. Então, precisamos fazer essa especificação no momento de inicialização da instância.</p>
                        </div>

                        <div class="formattedText" data-external-links="">
                                <p>Na última aula, começamos a preparar o disco. Agora, vamos concluir essas configurações, realizando a última etapa (talvez a mais importante): <strong>automatizar a montagem do disco na inicialização da máquina</strong>.</p>
<p>Ao executar o comando <code>df -h</code> no terminal, obtemos os dados das partições do sistema e, entre elas, consta <code>xvdf</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">df</span> -h</code></pre><table><thead><tr><th><strong>Filesystem</strong></th><th><strong>Size</strong></th><th><strong>Used</strong></th><th><strong>Avail</strong></th><th><strong>Use%</strong></th><th><strong>Mounted on</strong></th></tr></thead><tbody><tr><td>/dev/root</td><td>20G</td><td>1.9G</td><td>18G</td><td>10%</td><td>/</td></tr><tr><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td></tr><tr><td>/dev/xvdf1</td><td>7.9G</td><td>36M</td><td>4G</td><td>1%</td><td>/mnt/data</td></tr></tbody></table>
<p>Vamos simular um cenário em que agendamos uma manutenção e tivemos que reiniciar a máquina:</p>
<pre class="prettyprint"><code class="hljs language-undefined">sudo reboot</code></pre><p>Após alguns instantes, vamos fechar o terminal e abri-lo novamente, clicando no retângulo laranja no canto direito superior da instância Ubuntu-2. Agora, ao executar <code>df -h</code>, não teremos o disco <code>xvdf</code> listado!</p>
<h2>Montagem na inicialização</h2>
<p>Vamos colocar o <code>xvdf</code> no <code>fstab</code>, isto é, o arquivo que o Linux lê na inicialização da instância para montar os dispositivos. Trata-se de um arquivo crítico, então vamos editá-lo com cuidado. A princípio, vamos abrir o <code>fstab</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo vi /etc/fstab</code></pre><p>Nesse arquivo, já temos uma linha referente à montagem do disco que já vem na instância:</p>
<blockquote>
<p>LABEL=clouding-roots    /    ext4    defaults.discard    0 0</p>
</blockquote>
<p>Na segunda linha, usaremos uma sintaxe semelhante para inserir nosso disco. Colocaremos o nome do dispositivo, o ponto de montagem e o seu tipo:</p>
<blockquote>
<p>/dev/xvfd1    /mnt/data    ext4    defaults    0 1</p>
</blockquote>
<blockquote>
<p>Para alinhar verticalmente os dados da segunda linha com os dados da primeira linha, podemos usar a tecla "Tab" para ajustar o espaçamento. Vamos posicionar <code>/mtn/data</code> abaixo de <code>/</code>; <code>ext4</code> abaixo de <code>ext4</code>; <code>defaults</code> abaixo de <code>defaults.discard</code>; e <code>0 1</code> abaixo de <code>0 0</code>.</p>
</blockquote>
<p>Após gravar o arquivo, vamos testar. É importante ter um mecanismo de testes que não reinicie a máquina, porque, se houver algum problema e nós reiniciarmos a instância, ela possivelmente não subirá e ficará travada.</p>
<p>Então, vamos rodar o comando <code>sudo mount -a</code>, que montará tudo que está no arquivo <code>fstab</code> (sem precisar reiniciar a máquina):</p>
<pre class="prettyprint"><code class="hljs language-css">sudo mount -<span class="hljs-selector-tag">a</span></code></pre><p>Uma vez que esse comando não alegue erros, vamos executar o <code>df -h</code> de novo. O disco <code>dev/xvdf</code> aparecerá novamente entre as partições do sistema:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">df</span> -h</code></pre><table><thead><tr><th><strong>Filesystem</strong></th><th><strong>Size</strong></th><th><strong>Used</strong></th><th><strong>Avail</strong></th><th><strong>Use%</strong></th><th><strong>Mounted on</strong></th></tr></thead><tbody><tr><td>/dev/root</td><td>20G</td><td>1.9G</td><td>18G</td><td>10%</td><td>/</td></tr><tr><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td></tr><tr><td>/dev/xvdf1</td><td>7.9G</td><td>36M</td><td>4G</td><td>1%</td><td>/mnt/data</td></tr></tbody></table>
<h2>Permissão</h2>
<p>Por fim, podemos fazer um ajuste de permissão. Primeiramente, vamos acessar o diretório <code>mnt</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo /mnt</code></pre><p>Rodando um <code>ls -l</code>, constatamos que o <em>owner</em> (dono) é o <em>root</em>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">ls</span> -l</code></pre><blockquote>
<p>drwxr-xr-x 3 root root 4096 Sep 9 17:45 data</p>
</blockquote>
<p>A seguir, vamos entrar no diretório <code>data</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> data</code></pre><p>Ao tentar criar um arquivo de teste, a permissão será negada:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">echo</span> teste &gt; teste.txt</code></pre><blockquote>
<p>texte.txt: Permission denied</p>
</blockquote>
<p>Isso ocorre porque o <code>mtn</code> está como <em>root</em>. Para alterar o dono, vamos voltar ao diretório <code>mtn</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> ..</code></pre><p>Em seguida, executaremos o seguinte comando, com o nome do usuário e o seu grupo:</p>
<pre class="prettyprint"><code class="hljs language-bash">sudo <span class="hljs-built_in">chown</span> -R ubuntu:ubuntu data</code></pre><p>Agora, ao rodar o <code>ls -l</code> novamente, vamos reparar que o <em>owner</em> mudou:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">ls</span> -l`</code></pre><blockquote>
<p>drwxr-xr-x 3 ubuntu ubuntu 4096 Sep 9 17:45 data</p>
</blockquote>
<p>Na sequência, vamos acessar o diretório <code>data</code> mais um vez:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> data</code></pre><p>E repetir o comando:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">echo</span> teste &gt; teste.txt</code></pre><p>Dessa vez, não teremos o problema de permissão. Basta executar um <code>ls</code> para verificar que o arquivo <code>teste.txt</code> foi gerado na pasta.</p>
<p>Assim, terminamos a configuração! Temos um disco novo, disponível para uso. Se a máquina reiniciar, não teremos mais problemas. Podemos executar <code>exit</code> para encerrar o terminal.</p>
<h2>Removendo recursos</h2>
<p>Vamos para a última parte do curso, em que aprenderemos a trabalhar com contêineres na Lightsail.</p>
<p>O cenário de máquinas virtuais ainda existirão por muito tempo para suprir deferentes necessidades, mas muitas pessoas estão migrando de máquinas virtuais para contêineres. Então, vale a pena explorar como rodamos contêineres gerenciados por essa plataforma.</p>
<p>Antes de avançar para o contêineres, vamos fazer outra "faxina" e remover quaisquer recursos que não vamos mais utilizar. Desse modo, nos certificamos de que não teremos custos indesejados.</p>
<p>Na tela inicial da Lightsail, acessaremos a aba "<em>Storage</em>". Clicaremos nos três pontos no canto superior direito do <em>bucket</em> e selecionaremos "<em>Delete</em>". Para confirmar a ação, precisamos marcar a caixa "<em>I understang the effects of deleting this bucket</em>" e pressionar "<em>Force delete</em>".</p>
<p>Em seguida, clicaremos nos três pontos do disco "data" e selecionaremos "<em>Delete</em>". Para confirmar, pressionaremos "<em>Yes, delete</em>". Aparecerá um aviso de que essa operação não pode ser realizada, porque o disco está anexado a uma instância! Vamos pressionar "<em>Acknowledged</em>" para fechar.</p>
<p>Para desanexá-lo, clicaremos nos três pontos do disco "data" e selecionaremos "<em>Manage</em>". Na nova tela, vamos clicar em "<em>Detach</em>" no canto direito superior da instância Ubuntu-2. Pressionaremos "<em>Stop instance</em>" para parar a instância. Após alguns instantes, clicaremos no botão "<em>Yes, detach</em>" para desvincular o disco da instância. Agora, podemos voltar à aba "<em>Storage</em>" e deletar o disco.</p>
<p>Acessando a aba "<em>Instances</em>", clicaremos nos três pontos no canto direito superior da instância Ubuntu-2 e selecionaremos "<em>Delete</em>". Para confirmar, pressionaremos "<em>Yes, delete</em>".</p>
<p>Por fim, vamos até a aba "<em>Networking</em>". Clicaremos nos três pontos de Staticip-ubuntu-2 e selecionaremos "<em>Delete</em>". Para confirmar, clicaremos no botão "<em>Yes, delete</em>".</p>
<p>Removemos todos os recursos. Na sequência, vamos estudar os contêineres: preparemos a imagem e enviaremos para a Lightsail administrá-lo.</p>
                        </div>