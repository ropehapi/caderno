<div class="formattedText" data-external-links="">
                                <p>Agora que você já sabe os conceitos de <em>cloud computing</em> e criou máquinas virtuais com a <em>AWS</em>, vamos praticar e focar em <em>EC2</em>, o serviço de máquinas virtuais da <em>Amazon</em>.</p>
<p>Antes de criar nossas máquinas virtuais, porém, vamos relembrar conceitos importantes. É importante perceber que não vamos precisar gastar dinheiro para estudar sobre o <em>AWS S2</em>. Basta acessar aws.amazon.com/free, seremos apresentados ao "Nível gratuitos da AWS".</p>
<p>Nessa página, temos acesso a bastante coisa gratuita, como o acesso ao <em>EC2</em>. Temos, aproximadamente, 750 horas por mês para estudar de forma livre, com poucas restrições. Se clicarmos sobre "Amazon EC2 750 horas", seremos redirecionados à descrição da ferramenta.</p>
<p>O nome significa "Elastic Compute Cloud", uma nuvem de computação elástica que suporta instâncias maiores, menores e várias instâncias, por exemplo. Encontramos informações importantes, sobre clientes que usam a ferramenta, para que a usam e mais.</p>
<p>Nosso foco, porém, é garantir que não paguemos nada. Clicando em "Nível gratuito da AWS" somos redirecionados a uma página com detalhes de preço. Nela, veremos que o nível gratuito dá 750 horas grátis com a utilização de um tipo específico de instância, <em>t2.micro</em>.</p>
<blockquote>
<p>Obs:
Em regiões onde <em>t2.micro</em> não está disponível, será possível utilizar <em>t3.micro</em>. Esses números estão relacionadas à geração das máquinas.</p>
</blockquote>
<p>Esses são os métodos de precificação: "Sob demanda", que nos cobra conforme o utilizarmos, um modelo mais flexível e mais caro; e "Instâncias spot", que reserva um tempo em determinados tipos de máquina, o que faz a <em>AWS</em> te disponibilizar contas ociosas. A segunda opção é mais barata.</p>
<p>Existem outros tipos de precificação. Quando for trabalhar especificamente com isso, não esqueça de dar uma lida e conhecer todas as possibilidades.</p>
<p>Agora vamos relembrar como criamos uma instância de <em>EC2</em>. Na página inicial do <em>console</em>, temos informações importantes. O primeiro <em>widget</em>, "Visitados recentemente", como o próprio nome já diz, apresenta os recursos que utilizamos recentemente.</p>
<p>Acessaremos o <em>EC2</em>, buscando-o na barra de pesquisa. Vamos clicar em "Instâncias &gt; Instâncias &gt; Executar instâncias". Depois disso, vamos dar o nmome "ec2-first" para a tag. Abaixo, selecionaremos a imagem que criaremos na instância.</p>
<p>Basicamente, esse é o modelo que usaremos para subir nosso ambiente. Em início, vamos trabalhar com o padrão: <em>Amazon Linux</em>. Ao selecionar essa opção, podemos selecionar a arquitetura, mas vamos manter a do padrão. </p>
<p>Em "Tipo da instância", vamos manter "t2.micro", que se qualifica para o nível gratuito. Todas essas informações estarão atreladas à região que você seleciona. No vídeo, o instrutor selecionou "Norte da Virgínia".</p>
<p>Abaixo, em "Par de chaves (login)", geraremos uma chave pública e outra privada. Com elas, teremos acesso ao servidor. Precisamos ter uma na nossa máquina e outra no servidor, para garantir que acessemos o servidor sem a necessidade de inserir senha ou abrir nossa instância pro mundo geral.</p>
<p>Vammos clicar em "Criar par de chaves" e, a partir disso, vamos dar o nome "ec2". Vamos manter os detalhes padrão em "Tipo de par de chaves" e "Formato de arquivo de chave privada". Faremos isso porque vamos digitar comandos <em>Linux</em> dentro do <em>Windows</em> e usaremos o <em>OpenSSH</em>.</p>
<p>Depois, vamos clicar em "Criar par de chaves" e salvá-las. O instrutor as salvou em "wsl5 &gt; Ubuntu &gt; tmp". Agora vamos abrir o terminal e acessar a pasta com <code>cd /tmp/</code> e mover o arquivo "ec2" para a pasta <code>ssh/</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-built_in">cd</span> /tmp/
<span class="hljs-built_in">mv</span> ec2.pem ~/.ssh/
<span class="hljs-built_in">cd</span> ~/ .ssh/</code><button type="button" class="clipit">Copiar código</button></pre><p>Depois, vamos executar o comando <code>ls -l</code>, para que vejamos detalhes. Com isso, descobriremos que a chave "ec2.pem" tem muitas permissões. Vamos diminuir o número de permissões, para deixar a chave mais segura, com <code>chmod 400 ec2.pem</code>. Isso limitará a leitura da chave para o usuário.</p>
<p>De volta ao navegador, vamos manter as "Configurações de rede" inalteradas. Em "Configurar armazenamento", vamos "acoplar" um HD à máquina. Também não vamos alterar as informações padrão, porque estão dentro do limite gratuito.</p>
<p>Poderíamos configurar mais detalhes avançados, mas só faremos isso mais à frente no treinamento. Agora que finalizamos a configuração, vamos revisar e clicar em "Executar". Essa etapa pode ser demorada, mas isso depende de vários fatores.</p>
<p>Se acessarmos a documentação, no penúltimo link da página, encontraremos diversas formas de conexão, usando um cliente <em>SSH</em>, conectando diretamente ao painel e mais.</p>
<p>De volta a "Instâncias", na página do <em>EC2</em>, perceberemos que não há instâncias configuradas. Se atualizarmos a página, porém, veremos que a que acabamos de criar será exibida.</p>
<p>Vamos clicar no <em>ID</em> da instância. Lá, veremos mais informações, como o botão "Conectar". Clicando nele, vamos acessar a opção "Cliente SSH", que será utilizada pelo instrutor no vídeo. Vamos copiar o comando do exemplo e levá-lo até o terminal, dentro da parte da chave "ec2.pem".</p>
<p>A chave será utilizada para acessar o terminal remoto da imagem da <em>Amazon</em>. Esse domínio foi criado pela <em>Amazon</em> e atribuído à nossa máquina.</p>
<p>Quando digitamos o comando, o terminal informa que ainda não conhece esse <em>host</em> e pergunta se queremos adicioná-lo. Daremos "OK" e depois "yes". Agora a máquina foi adiciona à lista de hosts conhecidos.</p>
<p>Agora já estamos conectados à nossa instância remota no <em>EC2</em>.</p>
<p>No próximo vídeo, vamos relembrar o conceito de <em>security groups</em>.</p>
                        </div>