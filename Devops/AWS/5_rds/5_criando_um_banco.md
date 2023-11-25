<div class="formattedText" data-external-links="">
                                <p>Como comentamos no final do último vídeo, atualmente há um aviso de uma nova funcionalidade no painel do Amazon RDS, referente à implantação de servidores em várias zonas de disponibilidade. Possivelmente, quando você estiver assistindo ao curso, este aviso não esteja mais aparecendo na tela, então vou fechá-lo.</p>
<p>Agora, temos uma lista de recursos no console. O primeiro deles é "Instâncias de banco de dados". Vamos clicar nele para consultar uma lista dos bancos já criados, no caso, nenhum. Vamos clicar no botão "Criar banco de dados", na parte superior dessa tela.</p>
<p>De início, temos a seção "Escolher um método de criação de banco de dados", com duas opções:</p>
<ul><li>Criação padrão</li><li>Criação fácil</li></ul>
<p>A segunda opção contém sugestões de configuração da Amazon para facilitar o processo. Caso você esteja subindo um ambiente simples, recomenda-se o uso dessa opção, pois é mais rápido e fácil.</p>
<p>A primeira opção nos dá mais controle. Neste curso, vamos conhecer todas as opções da criação padrão para aprender a configurar mais detalhadamente. Vamos selecioná-la.</p>
<p>A seguir, temos a seção "Opções de mecanismo". Na subseção "Tipo de mecanismo", podemos escolher o servidor de banco de dados. Temos as seguintes opções:</p>
<ul><li>Amazon Aurora</li><li>MySQL</li><li>MariaDB</li><li>PostgreSQL</li><li>Oracle</li><li>Microsoft SQL</li></ul>
<p>Mais adiante, estudaremos o Amazon Autora. Agora, vamos selecionar "MySQL". Dessa forma, estamos informando a AWS para criar uma instância EC2 e instalar o MySQL. Na sequência, definiremos o que queremos nessa instância que será criada.</p>
<p>Na subseção "Edição", temos apenas a opção "MySQL Community". Outros bancos de dados podem ter outras possíveis opções.</p>
<p>Na subseção "Versão", vamos manter selecionada a versão mais recente. No momento da gravação, é a MySQL 8.0.31. Como estamos apenas aprendendo sobre o processo, você não precisa se preocupa com qual versão selecionar.</p>
<p>Escolhido o banco de dados, agora falaremos sobre a instância que será criada. Na seção "Modelos", temos três opções:</p>
<ul><li><strong>Produção</strong>, já pensado em alta escalabilidade, com bastante armazenamento, memória e CPU</li><li><strong>Dev/Text</strong> (ambiente de desenvolvimento), com um pouco menos de performance, porém que ainda aguentará bastante carga para podermos testar a aplicação de forma semelhante ao ambiente de produção</li><li><strong>Nível gratuito</strong>, mais modesto e que não nos permite selecionar todas as opções.</li></ul>
<p>Vamos selecionar a opção "Nível gratuito".</p>
<p>Na seção "Disponibilidade e durabilidade", poderíamos informar se estamos criando uma única instância do banco de dados ou diversas instâncias em zonas de disponibilidade diferentes. Ou até mesmo criar um <em>cluster</em>, diversas máquinas principais agrupadas. Como selecionamos o nível gratuito, essas opções não estão disponíveis, só podemos criar uma única instância.</p>
<p>A seguir, há um resumo do que selecionamos até agora:</p>
<blockquote>
<ul><li><strong>Método de criação de banco de dados:</strong> Criação padrão</li><li><strong>Tipo de mecanismo:</strong> MySQL</li><li><strong>Edição:</strong> MySQL Community</li><li><strong>Versão:</strong> MySQL 8.0.31</li><li><strong>Modelo:</strong> Nível gratuito</li></ul>
</blockquote>
<p>Na sequência, vamos para a seção "Configurações". Assim como demos nomes para instâncias EC2, definiremos o nome "primeiro-bd" como identificador da nossa instância RDS.</p>
<p>Na subseção "Configurações de credenciais", vamos definir o nome do usuário principal. No meu caso, colocarei "vinicius".</p>
<p>Em seguida, podemos determinar configurações de senha. Podemos utilizar o AWS Secrets Manager (serviço da Amazon para guardar informações confidenciais) ou gerar uma senha forte automaticamente. No nosso caso, não vamos selecionar nenhuma dessas opções.</p>
<p>No campo "Senha principal", definiremos uma senha fácil. Logo abaixo, vamos digitá-la novamente para confirmá-la.</p>
<blockquote>
<ul><li><strong>Identificador da instância de banco de dados:</strong> primeiro-bd</li><li><strong>Nome do usuário principal:</strong> vinicius</li><li><strong>Senha principal:</strong> (defina sua senha)</li></ul>
</blockquote>
<p>Chegamos à seção "Configuração da instância", em que selecionaremos que tipo de máquina será criada. No EC2, podíamos escolher a opção "t2.micro" no nível gratuito. No RDS, será semelhante.</p>
<p>Já que selecionamos o nível gratuito na parte de modelos, as possibilidades de classes de instâncias são mais limitadas nessa seção. Temos apenas a opção "Classes com capacidade de intermitência", que basicamente não são otimizadas para nada em especial. Elas aguentam a execução de muitas aplicações, mas não são robustas. Vamos manter selecionada a opção padrão "db.t3.micro", que tem 1 GB de memória RAM. Isso será o suficiente para nosso projeto.</p>
<blockquote>
<ul><li><strong>Classe da instância de banco de dados:</strong><ul><li>Classes com capacidade de intermitência</li><li>db.t3.micro</li></ul>
</li></ul>
</blockquote>
<p>A seguir, temos um ponto muito importante quando falamos de banco de dados. Na seção "Armazenamento", podemos selecionar se usaremos um SSD ou um HD e que tipo de SSD queremos.</p>
<p>Como comentamos anteriormente, este curso é específico de banco de dados na Amazon. Uma pessoa administradora de banco de dados (DBA) saberá que tipo de disco utilizar para cada cenário. Como estamos apenas aprendendo, basta entendermos que existem diversos tipos de discos à disposição. Um conhecimento mais aprofundado sobre <em>hardware</em> vai além do escopo deste curso.</p>
<p>Basicamente, em "Tipo de armazenamento", temos algumas opções de SSD e uma opção de HD Magnético. Vamos deixar selecionado "SSD de uso geral (gp2)".</p>
<p>No campo "Armazenamento alocado", é possível definir um mínimo de <em>gigabytes</em>. Por exemplo, podemos determinar um mínimo de 20 GiB e uma instância será criada com um armazenamento de 20 GiB reservados para esse banco de dados.</p>
<p>Logo abaixo, vamos marcar a opção "Habilitar escalabilidade automática do armazenamento". Assim, conforme nosso banco cresce, a AWS pode adicionar automaticamente mais disco para nós até o limite que definirmos no campo "Limite máximo de armazenamento", mais abaixo. Vamos colocar 1024 GiB, que corresponde a 1 <em>terabyte</em>.</p>
<blockquote>
<ul><li><strong>Tipo de armazenamento:</strong> SSD de uso geral (gp2)</li><li><strong>Armazenamento alocado:</strong> 20</li><li><strong>Escalabilidade automática do armazenamento:</strong> Habilitar</li><li><strong>Limite máximo de armazenamento:</strong> 1024</li></ul>
</blockquote>
<p>Vale lembrar que, à medida que usamos mais disco, isso acarretará mais custos. Comentaremos sobre precificação mais adiante no curso. Em resumo, é economicamente mais vantajoso começar com uma quantidade menor de memória e, somente se necessário, aumentamos.</p>
<p>A próximo seção é "Conectividade". Podemos nos conectar diretamente a algum recurso do EC2, alocando uma instância específica para isso. No nosso caso, não vamos configurar nenhuma ligação direta, então selecionaremos "Não se conectar a um recurso de computação do EC2".</p>
<p>Em "Tipo de rede", colocaremos "IPv4". Em "Nuvem privada virtual (VPC)", vamos manter a rede virtual padrão "Default VPC". Já estudamos VPCs em cursos anteriores, então sabemos que é possível ter mais controle sobre esse recurso. Não vamos focar nesse ponto agora.</p>
<p>Em "Grupo de sub-redes de banco de dados", podemos ter um grupo de quais sub-redes conterão nossas instâncias. No caso, temos apenas o "padrão".</p>
<p>Em "Acesso público", selecionaremos "Sim" para definir que o banco pode ser acessado publicamente. Note que, mesmo não tendo muitos conhecimentos de VPC, seria bem simples criar uma instância privada.</p>
<p>Em "Grupo de segurança", é possível criar um ou selecionar um existente. No caso, vamos escolher um existente e marcar o "default". Em "Zona de disponibilidade", colocaremos "Sem preferência". Por padrão, cada zona de disponibilidade tem sua sub-rede.</p>
<p>Em "RDS Proxy", podemos criar um <em>proxy</em> para aumentar ainda mais a resiliência e a escalabilidade do nosso banco. No nosso cenário, isso não é necessário.</p>
<blockquote>
<ul><li><strong>Recurso de computação:</strong> Não se conectar a um recurso de computação do EC2</li><li><strong>Tipo de rede:</strong> IPv4</li><li><strong>Nuvem privada virtual:</strong> Default VPC</li><li><strong>Grupo de sub-redes de banco de dados:</strong> padrão</li><li><strong>Acesso público:</strong> Sim</li><li><strong>Grupo de segurança de VPC:</strong><ul><li>Selecionar existente</li><li>default</li></ul>
</li><li><strong>Zona de disponibilidade:</strong> Sem preferência</li></ul>
</blockquote>
<p>Na seção "Autenticação de banco de dados", selecionaremos "Autenticaçao de senha". Poderíamos também limitar o acesso, de modo a entrar apenas com o serviço de autenticação da Amazon (IAM) ou o Kerberos.</p>
<p>Na seção "Monitoramento", temos a opção de habilitar o monitoramento. Não vamos selecionar essa opção, mas há cursos na Alura sobre o assunto, caso te interesse.</p>
<ul><li><strong>Autenticação de banco de dados:</strong> Autenticação de senha</li><li><strong>Monitoramento:</strong> Não habilitar</li></ul>
<p>Note que ainda existem mais opções avançadas que poderíamos explorar. As possibilidades são muitas. Ao final da página, temos uma seção de custos mensais estimados. Vamos clicar em "Criar banco de dados".</p>
<p>Esse processo pode ser demorado. Inclusive, mais demorado que a criação de uma instância EC2, já que envolve</p>
<p>Entendemos em detalhes cada uma das partes da criação de um banco de dados no RDS. Na sequência, vamos conversar um pouco sobre o Amazon Aurora.</p>
                        </div>