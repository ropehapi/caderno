<div class="formattedText" data-external-links="">
                                <p>Nesta aula, vamos recapitular o que aprendemos no curso de EC2 sobre RDS, porém com mais detalhes. Conheceremos o RDS e criaremos um banco de dados, conversando sobre cada parte.</p>
<p>Após logar no console da AWS, vamos digitar por "RDS" na barra de busca no topo da página. Antes de acessar o serviço, note como o nome dele aparece:</p>
<blockquote>
<p><strong>RDS</strong></p>
<p>Managed Relational Database Service</p>
</blockquote>
<p>A sigla RDS significa "<em>Relational Database Service</em>" (serviço de banco de dados relacional). Contudo, o termo "<em>Managed</em>" (gerenciado) é o ponto principal desse serviço. Vamos acessar o serviço RDS.</p>
<p>Como comentamos anteriormente, temos a opção de criar uma instância EC2, instalar um banco de dados e disponibilizá-lo, através de rede privada ou da internet. Então, por que a Amazon fornece um serviço específico para banco de dados? Justamente por causa desse "<em>managed</em>". A Amazon gerenciará para nós a complexidade de uma gestão de banco de dados.</p>
<p>Por exemplo, a seleção do tipo de instância que criaremos será facilitada. A Amazon já dará algumas sugestões direcionadas para banco de dados. Também conseguiremos configurar o escalonamento do nosso espaço de armazenamento em disco de forma simplificada. Configuraremos <em>back-ups</em> automáticos de modo mais fácil. Tudo que precisaríamos fazer manualmente ficará mais simples com o RDS.</p>
<p>Além disso, ao utilizar RDS, temos outras funcionalidades. Com o painel do RDS aberto, atualmente há um aviso de uma nova funcionalidade. Talvez quando você estiver assistindo, ele não esteja mais aparecendo. </p>
<p>Esse aviso diz respeito à possibilidade de forma facilitada de implantar um servidor (ou vários servidores) de banco de dados que estarão disponíveis em várias zonas de disponibilidades. Caso uma delas caia, temos outra pronta para nos atender.</p>
<p>Esses detalhes são possíveis de fazer no EC2, mas configurar réplicas de um banco de dados manualmente e colocá-las em subredes diferentes seria bem trabalhoso. Entre outras opções, temos criação de <em>cluster</em>, gestão de <em>back-ups</em>, exportação de <em>back-ups</em> diretamente para o S3, por exemplo. Essas facilidades são o motivo para optar pelo RDS, em vez de criar uma instância no EC2 e realizar a configuração manualmente.</p>
<p>Na sequência, vamos relembrar como criar um banco de dados no RDS com mais detalhes.</p>
                        </div>