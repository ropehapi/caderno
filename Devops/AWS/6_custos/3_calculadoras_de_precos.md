<div class="formattedText" data-external-links="">
                                <p>Você sabia que a AWS fornece uma calculadora de preços que podemos usar para fazer a estimativa de custos do nosso projeto?</p>
<p>Com ela, é possível ter uma estimativa dos custos de um projeto antes de criar a infraestrutura dele. Assim, podemos nos preparar para não termos nenhuma surpresa.</p>
<p>Voltando ao buscador Google, digitaremos "aws calculadora" na barra de busca. Podemos clicar no primeiro link ("<em>AWS Pricing Calculator</em>").</p>
<p>Com a página da Calculadora de preços da AWS aberta, clicaremos em "Criar estimativa", à direita da página. O site nos redirecionará a outra página, onde selecionaremos o serviço desejado.</p>
<p>Logo abaixo do título "Serviços da AWS", manteremos marcada a opção "Pesquisar por tipo de local" e "Região", no campo imediatamente abaixo dela. Em "Escolher uma região", escolheremos "Leste dos EUA (N. da Virgínia)" ou "us-east-1", a região padrão da AWS para a maioria dos serviços.</p>
<p>Em "Localizar serviço", digitaremos "ec2". Logo abaixo, aparecerá a opção "Amazon EC2" com o botão "Configurar". Após clicar nesse botão, uma nova janela abrirá.</p>
<p>Podemos então adicionar uma descrição da máquina como, por exemplo, "maquina dev". O campo "escolher uma região" já vem preenchido. Mais abaixo, temos "Especificações do EC2". Em Locação, podemos deixar "instâncias compartilhadas" e manter o "Linux" como Sistema operacional padrão oferecido pela AWS.</p>
<p>Em "Cargas de trabalho", manteremos selecionada a opção "Uso constante", para indicar que a nossa máquina estará sempre ligada.</p>
<p>Em "Número de instâncias", manteremos "1", pois o Dev precisa de apenas uma única máquina virtual. Em "Instâncias do EC2", escreveremos "t2.micro" no campo "Pesquisar tipo de instância". Logo abaixo, selecionaremos a opção correspondente ("t2.micro").</p>
<h3>Opções de Pagamento</h3>
<p>Descendo mais um pouco na página, encontraremos as opções de pagamento. Podemos reservar a máquina por um tempo determinado, com as opções de um ano ou três anos, mas a opção mais comum é reservá-la "Sob demanda". Podemos selecionar essa última opção.</p>
<p>Conforme as opções que escolhemos até aqui, podemos descer um pouco mais na barra de rolagem e verificar que, logo abaixo da opção "Sob demanda", recebemos a estimativa de que essa máquina nos custará US$8,47 por mês.</p>
<blockquote>
<p>Atenção: os preços do AWS estão sempre em dólares americanos.</p>
</blockquote>
<p>Mais abaixo, temos outras opções. Digamos que desejamos armazenar os dados por um tempo um pouco maior sem que eles fiquem presos a essa máquina.</p>
<h3>Amazon Elastic Block Store (EBS)</h3>
<p>Podemos expandir o campo "<em>Amazon Elastic Block Store (EBS)</em>". Em "SSD de uso geral (gp3) - IOPS", podemos visualizar a mensagem "O gp3 oferece suporte a um máximo de 16.000 IOPS por volume". No campo de texto logo abaixo, podemos digitar exatamente esse máximo ("16000").</p>
<p>Ao fazer isso, a nossa cotação subiu para o valor de US$ 73,47 por mês. Para diminuir esse valor, podemos editar o campo anterior para 1.000 IOPS. O valor volta a cair para US$8,47 por mês.</p>
<p>Algo semelhante acontece quando colocamos no campo de texto o número máximo de 1000 Mbps por volume disponíveis para Throughput. O valor mensal sobe para US$ 43,47. Se editarmos o campo para 100 Mbps, o valor volta a US$ 8,47.</p>
<p>Em "Quantidade de armazenamento", podemos indicar 50 GB. O valor subirá para US$ 12,47 por mês. Tenha em mente que, se você precisar de mais armazenamento, o custo subirá.</p>
<h3>Transferência de dados</h3>
<p>A máquina virtual não está isolada do mundo, ela precisa se conectar à internet. Não precisamos alterar nada em  <strong>Transferência de dados de entrada</strong>. Quanto à Transferência de dados de saída, selecionaremos "Internet" em "Transferência de dados a". Ao lado, temos o campo "Quantidade de dados", podemos trocar de "TB por mês" para "GB por mês".</p>
<p>No campo "Inserir quantidade", podemos dizer que enviamos 20 GB por mês. Isso altera o preço final para US$ 14,27. Se colocássemos 200 GB por mês, o valor subiria para US$ 30,47.</p>
<h4>Mas como podemos definir quantos GB enviamos por mês?</h4>
<p>Se tivermos, por exemplo, uma API que envia só texto, raramente ultrapassaremos a marca de 2 GB por mês, mesmo com muitos acessos.</p>
<blockquote>
<p>Uma requisição de API tem, geralmente, menos de 1 MB.</p>
</blockquote>
<p>Lembrando que 1.000 KB correspondem a 1 MB e 1.000 MB correspondem a 1 GB. Por outro lado, se estivermos enviando um site com imagens ou vídeos, esses arquivos geralmente são mais pesados.</p>
<p>Supondo que estejamos trabalhando com uma API, manteremos a quantidade em 2 GB por mês. O custo diminuirá para US$ 12,65 por mês.</p>
<p>Com essas informações, podemos clicar no botão no canto inferior direito "Salvar e adicionar serviço". Aparecerá uma mensagem no topo da página "Adicionado com êxito Amazon EC2 estimar".</p>
<h3>Resumo da estimativa</h3>
<p>Se não precisarmos de nenhum outro serviço, podemos clicar no botão à direita "Visualizar resumo". Isso nos levará para outra página, com o resumo da estimativa. O custo inicial é zero, com um custo mensal de US$ 12,65 por mês. Isso significa que pagaríamos US$ 151,80 por ano.</p>
<p>Se a cotação do dólar girar em torno de R$ 4,00, estaríamos falando em um custo anual de cerca de R$ 400,00. Se o dólar subir para R$ 5,00, já estamos falando de mais ou menos R$ 700,00 por ano e assim por diante.</p>
<p>Lembrando que a AWS pode alterar esses custos conforme a necessidade. Ela geralmente avisa quando isso acontecer.</p>
<p>Com isso, fizemos uma estimativa de custo para subir uma máquina virtual por um ano. A seguir, criaremos um aviso para verificar se os custos reais estão compatíveis com a nossa estimativa.</p>
                        </div>