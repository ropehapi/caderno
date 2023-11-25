<div class="formattedText" data-external-links="">
                                <p>Agora, falaremos de assunto muito importante quando estudamos qualquer recurso em qualquer ambiente de nuvem: <strong>a precifição</strong>. Vamos entender como funciona a cobrança do serviço RDS.</p>
<h2>Precificação</h2>
<p>Para encontrar os preços de qualquer serviço da AWS, basta pesquisar o nome do serviço seguido da palavra "pricing". Por exemplo, vamos abrir uma nova aba no navegador e buscar "rds pricing". O primeiro resultado já será a <a href="https://aws.amazon.com/pt/rds/pricing/" target="_blank" rel="nofollow noopener noreferrer">página de preços do RDS</a>.</p>
<p>No topo dessa página, temos o título "Definição de preço do Amazon RDS". Logo abaixo, há dois grandes botões:</p>
<ul><li>Comece a usar gratuitamente</li><li>Solicite uma cotação de preços</li></ul>
<p>Como percebemos anteriormente, podemos usar alguns recursos gratuitamente. Já se você trabalha em uma empresa e pretende gerenciar um serviço grande, é interessante entrar em contato com o serviço de vendas da Amazon para conseguir descontos. Para nossos estudos, vamos apenas focar na lista de preços disponibilizada.</p>
<p>Primeiramente, há informações sobre o nível gratuito, semelhante ao EC2. Temos 750 horas por mês em instâncias db.t2.micro, db.t3.micro e db.tg4.micro em uma única zona de disponibilidade. Se tivermos mais de uma instância, as 750 horas são divididas entre elas. Por exemplo, podemos ter uma instância rodando o mês todo ou duas instâncias rodando por 15 dias sem custos.</p>
<p>Além disso, há custos pelo armazenamento. No nível gratuito, temos até 20 GB de armazenamento de uso geral (SSD) e 20 GB para <em>back-ups</em> automatizados, utilizando <em>snapshots</em>.</p>
<p>Em resumo, são 750 horas nas instâncias listadas acima e 40 GB de armazenamento (20 GB para uso geral e 20 GB para <em>back-ups</em>).</p>
<p>Assim, já temos uma noção de como funciona a precificação:</p>
<ul><li>por tipo de instância, cobrado por hora</li><li>pela quantidade de armazenamento utilizada</li></ul>
<p>O custo de cada uma dessas partes depende do banco de dados escolhido. Por exemplo, o Amazon Aurora é mais caro que o MySQL, dado que é um banco de dados mais performático e que oferece mais recursos. Em uma nova aba, vamos <a href="https://aws.amazon.com/pt/rds/aurora/pricing/?pg=pr&amp;loc=1" target="_blank" rel="nofollow noopener noreferrer">acessar a definição de preço do Amazon Aurora</a>. Em outra aba, podemos <a href="https://aws.amazon.com/pt/rds/mysql/pricing/?pg=pr&amp;loc=2" target="_blank" rel="nofollow noopener noreferrer">abrir a definição de preço do Amazon RDS para MySQL</a>.</p>
<h2>Amazon Aurora</h2>
<p>Na página definição de preços do Amazon Aurora, temos uma explicação desse serviço. No tópico "Instâncias de banco de dados", há duas opções de edições:</p>
<ul><li>Aurora edição compatível com MySQL</li><li>Autora edição compartível com PostgreSQL</li></ul>
<p>Ao expandir cada seção, podemos ler uma explicação dos tipos de bancos de dados disponíveis, com exemplos de custos conforme o crescimento do sistema. Selecionando a opção "Instância sob demanda provisionada", há uma tabela de preços. Por exemplo, <strong>uma instância db.t4g.medium custa $0,073 por hora</strong>.</p>
<h2>Amazon RDS para MySQL</h2>
<p>Semelhante ao Amazon Aurora, também há uma explicação no início da página de definição de preços do Amazon RDS para MySQL.</p>
<p>No tópico "Instâncias de banco de dados sob demanda", podemos selecionar a implantação "Single-AZ" (isto é, em uma única zona de disponibilidade) e escolher uma região para consultar uma tabela bem simples de preços por hora. Por exemplo, na região "Leste dos EUA (Ohio)", <strong>uma instância db.t4g.medium tem o preço de $0,065 por hora</strong>.</p>
<p>No tópico "Armazenamento de banco de dados", também temos uma precificação diferente para cada tipo de SSD. Por exemplo, um SSD de uso geral (gp2) tem o custo de $0,115 por GB por mês.</p>
<p>Em outras palavras, pagamos com base na instância por hora e com base do volume de dados utilizados por <em>gigabytes</em> por mês.</p>
<h2>Comparações</h2>
<p>Repare que a precificação de uma instância comum da RDS é relativamente simples. Já a precificação do Amazon Aurora é um pouco mais complexa.</p>
<p>Podemos comparar, por exemplo, o preço de instâncias db.t4g.medium. No momento de gravação deste curso, o custo no Amazon Aurora é de $0,073 por hora. Já no RDS para MySQL, o custo é de $0,065 por hora. Como comentamos, o Amazon Aurora é mais caro, pois é um serviço capaz de lidar com maiores volumes de dados.</p>
<p>Além disso, podemos (e devemos) <a href="https://calculator.aws/#/" target="_blank" rel="nofollow noopener noreferrer">utilizar a calculadora de custos da AWS</a>. Ela serve para diversos serviços da AWS, inclusive os que estamos explorando neste curso.</p>
<p>Na calculadora, podemos informar o tipo de instância, a região e o período de uso para obter um custo mensal estimado, no canto inferior esquerdo da tela. Dessa forma, temos flexibilidade para nos planejar, pois sabemos uma estimativa de custos antes de contratar o serviço.</p>
<p>Supondo que recebemos uma solicitação para criar uma instância de banco de dados no RDS, podemos usar a calculadora para estimar preços mensais e apresentá-los para as pessoas responsáveis pelos custos.</p>
<p>Na sequência, vamos aprender a gerenciar mais recursos do RDS, por exemplo, configuração de <em>back-ups</em> e uso de mais de uma zona de disponibilidade. Descobriremos o que podemos fazer para tornar nossa infraestrutura de banco de dados mais escalável.</p>
                        </div>