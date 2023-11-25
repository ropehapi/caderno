<div class="formattedText" data-external-links="">
                                <p>Nessa aula aprenderemos detalhadamente como preencher alguns campos do DynamoDB. </p>
<h1>Outras configurações do DynamoDB</h1>
<p>Na página do DynamoDB, clicamos no botão "Visualizar detalhes da tabela". Notamos que, por padrão, algumas configurações foram feitas automaticamente, como o <strong>Modo de capacidade</strong> que está selecionado a opção "Provisionada". </p>
<p>Para entender melhor essas funcionalidades, no centro superior da tela, clicamos em "Tabelas". Selecionamos nossa tabela e clicamos em "Excluir". </p>
<p>Feito isso, abre uma janela com a opção de excluir todos os alarmes ou de criar um backup. Selecionamos a primeira opção, e abaixo, no campo, digitamos "excluir", por fim, clicamos no botão "Excluir tabela" localizado no canto inferior direito da tela. </p>
<p>Agora, no canto superior direito, clicamos em "Criar tabela". Somos direcionados para uma página com campos de preenchimento.</p>
<p>No primeiro, definimos o <strong>Nome da tabela</strong> como "nome-tabela". Abaixo, definimos a <strong>Chave de partição</strong> seguido da <strong>Chave de classificação - opcional</strong>, conforme já aprendemos.</p>
<p>Descendo a página, em <strong>Configurações da tabela</strong>, selecionamos a opção "Personalizar configurações". Entenderemos o passo a passo de como preencher essas áreas.</p>
<p>Em <strong>Classe de tabela</strong> podemos selecionar as opções:</p>
<blockquote>
<p><strong>DynamoDB Standard -</strong> É o tipo padrão de tabela. Ela é recomendada para a grande maioria das tabelas que armazenam dados acessados com frequência, sendo a taxa de transferência (leituras e gravação) o custo de tabela dominante. </p>
<p><em>Exemplo:</em> Nossas configurações do sistema são acessadas com frequência pelos usuários, portanto essa é a opção ideal.</p>
<p><strong>DynamoDB Standard-IA -</strong> É recomendada para tabelas que armazenam dados acessados com pouca frequência, sendo o armazenamento o custo de tabela dominante.</p>
</blockquote>
<p>Nós selecionaremos o "DynamoDB Standard". Em seguida, temos uma <strong>Calculadora de capacidade</strong>. Nela preenchemos informações como: </p>
<ul><li><p><strong>Tamanho médio do item (KB)</strong></p>
</li><li><p><strong>Leitura de itens/segundo</strong></p>
</li><li><p><strong>Consistência de leitura:</strong></p>
<ul><li>Eventualmente consistente</li><li>Fortemente consistente</li><li>Transacional</li></ul>
</li><li><p><strong>Gravação de itens/segundo</strong></p>
</li><li><p><strong>Consistência da gravação</strong></p>
</li></ul>
<p>A opção selecionada no campo <strong>Consistência de leitura</strong> irá variar de acordo com seu objetivo e necessidade. </p>
<p>Se ao adicionar um item na tabela você precisa que ele apareça <strong>imediatamente no índice</strong>, então a opção que deve ser escolhida é "Fortemente consistente". Se essa ação pode levar alguns milissegundos para ser replicado no índice, a opção escolhida pode ser "Eventualmente consistente". Lembrando que isso também influencia no preço.</p>
<p>Após preencher todas essas informações a ferramenta mostra o <strong>Custo estimado por mês</strong>. A partir disso é possível avaliar quanto será cobrado.</p>
<p>Descendo a tela encontramos as <strong>Configurações de capacidade de leitura/gravação</strong>. As opções de escolha são o modo de capacidade <strong>Sob demanda</strong>, que funciona automaticamente conforme recebe pedido de leitura e gravação, e o <strong>Provisionada</strong>, que precisa ser configurado.</p>
<p>Se clicarmos nessa segunda opção, a ferramenta abre uma nova aba de preenchimento. Em <strong>Capacidade de leitura</strong> podemos definir o <strong>Auto Scaling</strong>. </p>
<p>Ele é o <strong>ajuste dinâmico da capacidade de taxa de transferência provisionada</strong>. Para utilizá-lo, basta clicar em "Ativado". A outra opção é definir especificamente quanto queremos de unidades de capacidade provisionada, clicando em "Desativado".</p>
<p><strong>Podemos preencher esses campos da seguinte forma:</strong></p>
<blockquote>
<p><strong>Unidades de capacidade mínima:</strong> 1</p>
<p><strong>Máximo de unidades de capacidade:</strong> 10</p>
<p><strong>Utilização pretendida (%):</strong> 70</p>
<p>Seguindo esse exemplo, se atingir 70% da unidade mínima o ajuste será feito. </p>
</blockquote>
<p>Abaixo, o campo <strong>Capacidade de gravação</strong> funciona da mesma forma. Podemos selecionar a opção "Ativado" para o ajuste dinâmico e "Desativado" para definir as unidades de capacidade e utilização pretendida.</p>
<p>Descendo a tela, encontramos o campo chamado <strong>Índices secundários</strong>. </p>
<blockquote>
<p>Anteriormente aprendemos que o <strong>Índice local</strong> só pode ser criado na elaboração da tabela, é nesse campo que isso é feito. Se a tabela já estiver pronta só é possível possível criar o <strong>Índice Global</strong>. </p>
</blockquote>
<p>Abaixo, a ferramenta mostra o <strong>Custo estimado da capacidade de leitura/gravação</strong> referente aos índices criados.</p>
<p>Em <strong>Criptografia em repouso</strong> o preenchimento é feito assim como na RDS. As opções de gerenciamento de chaves de criptografia são:</p>
<blockquote>
<ul><li>Propriedade do Amazon DynamoDB</li><li>Chave gerenciada pela AWS</li><li>Armazenada na sua conta, de sua propriedade e gerenciada por você</li></ul>
</blockquote>
<p><strong>Essas são as configurações do DynamoDB.</strong></p>
<h1>Interfaces programáticas</h1>
<p>Existem diversas formas de utilizar o DynamoDB, isso dependerá da linguagem de programação utilizada. Na documentação da AWS encontramos mais informações sobre isso. </p>
<p>A opção de <a href="https://docs.aws.amazon.com/pt_br/amazondynamodb/latest/developerguide/Programming.SDKs.Interfaces.LowLevel.html" target="_blank" rel="nofollow noopener noreferrer">Interfaces de baixo nível</a> utiliza todos os atributos e itens para ter um controle maior, porém é mais trabalhosa. </p>
<p>Também é possível trabalhar com <a href="https://docs.aws.amazon.com/pt_br/amazondynamodb/latest/developerguide/Programming.SDKs.Interfaces.Document.html" target="_blank" rel="nofollow noopener noreferrer">Interfaces de documento</a>. Nesse caso, é possível acessar os atributos de forma mais fácil e direta.</p>
<p>Já a terceira opção é a <a href="https://docs.aws.amazon.com/pt_br/amazondynamodb/latest/developerguide/Programming.SDKs.Interfaces.Mapper.html" target="_blank" rel="nofollow noopener noreferrer">Interface de persistência de objetos</a>. Por meio dela é possível recuperar um objeto no mapeador dos dados.</p>
<p>Se você é uma pessoa desenvolvedora irá reparar que a parte de programação é mais simples. </p>
<p>Os conceitos do curso foram focados em <strong>DynamoDB</strong>, no qual você irá criar a tabela e definir os itens. Já no código você analisará a documentação conforme sua linguagem e assim aplicará o conteúdo ensinado no curso, como adicionar um novo atributo em JavaScript ou buscar um índice em PHP. </p>
<p>Para que você possa aprimorar ainda mais seu conhecimento em DynamoDB, disponibilizamos no Para Saber Mais dois conteúdos de assuntos mais avançados. Um fala sobre <strong>tabelas globais</strong>, que não dependem da região da AWS, e outro sobre <strong>DAX</strong>, uma camada de cache que pode ser adicionada no DynamoDB e que, embora seja uma opção paga, pode aumentar ainda mais a performance. </p>
<p>Com os conhecimentos adquiridos nesse curso você já tem todo preparo inicial para começar a <strong>implantar</strong> sistemas que utilizam DynamoDB.</p>
                        </div>