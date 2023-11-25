<div class="formattedText" data-external-links="">
                                <p>Antes de dar continuidade aos nossos estudos, um aviso importante! Anteriormente, criamos duas instâncias na AWS. Como não vamos mais utilizá-las, <strong>lembre-se de excluí-las</strong>. Assim, não teremos cobranças indesejadas no futuro.</p>
<p>Neste vídeo, vamos criar outra VPC. Dessa vez, teremos um <strong>sub-rede pública</strong> (por exemplo, com um servidor web) e uma <strong>sub-rede privada</strong> (por exemplo, com um banco de dados, um serviço de mensageria ou servidor de aplicação). Na sub-rede privada, podemos colocar recursos que não precisam ser publicamente acessíveis pela internet.</p>
<h2>Nova VPC</h2>
<p>No console da Amazon, vamos até o painel da VPC. No topo da página, mais à esquerda, clicaremos no botão "Criar VPC" para definir as configurações de uma nova VPC.</p>
<p>De início, teremos duas opções para criação de recursos: "Somente VPC" ou "VPC e muito mais". Com a primeira opção, criaríamos apenas a VPC e, depois, precisaríamos criar as sub-redes, definindo as zonas de disponibilidades, entre outras configurações. Com a segunda opção, é possível criar esses recursos com mais facilidade, então vamos selecioná-la.</p>
<p>Na seção "Geração automática da etiqueta de nome", vamos manter selecionada a opção "Gerar automaticamente". No campo abaixo, digitaremos "infra". Dessa forma, o nome da nossa VPC será "infra-vpc", como mostrado na pré-visualização, à direita da tela.</p>
<p>Na seção "Bloco CIDR IPv4", podemos definir quantos IPs queremos. Quando clicamos na área de texto, surgem quatro setas abaixo do campo, de modo que podemos retroceder e avançar o bloco (setas para esquerda e direita), aumentar e diminuir o número de IPs (setas para cima e para baixo). Vamos deixar o valor padrão: 10.0.0.0/16, com 65.536 IPs.</p>
<p>Na seção "Bloco CIDR IPv6", podemos definir se queremos alocar blocos IPv6. Não trabalharemos com eles neste curso, então vamos manter selecionada a opção "Nenhum bloco CIDR IPv6".</p>
<p>Na seção "Locação", é possível escolher entre "Padrão" ou "Dedicado". Este último é mais específico para cada uma das instâncias. Em nosso cenário, optaremos pelo "Padrão".</p>
<p>Na seção "Número de zonas de disponibilidade", vamos selecionar apenas uma zona, para simplificar e ter menos sub-redes. Como comentamos há pouco, definiremos duas sub-redes nessa zona.</p>
<p>Vale lembrar que não precisamos ter uma zona de disponibilidade para cada sub-rede. É possível ter várias sub-redes na mesma zona.</p>
<p>Em seguida, vamos clicar na seta à esquerda de "Personalizar AZs" para expandir essa seção. Nela, podemos personalizar que zona de disponibilidade desejamos. Como já utilizamos "us-east-2a" e "us-east-b", vamos selecionar "us-east-2c".</p>
<p>Recapitulando: teremos uma VPC com uma zona de disponibilidade na "us-east-2c".</p>
<p>Na seção "Número de sub-redes públicas", para cada zona de disponibilidade, podemos adicionar apenas uma sub-rede pública. Então, vamos selecionar o número 1.</p>
<p>Na seção "Número de sub-redes privadas", para cada zona de disponibilidades, temos a opção de ter até 2 sub-redes. No caso, vamos definir apenas uma, selecionando o número 1.</p>
<p>Na sequência, vamos clicar na seta à esquerda de "Personalizar blocos CIDR de sub-redes" para expandir essa seção. Deixaremos os valores padrões:</p>
<blockquote>
<ul><li><strong>Bloco CIDR da sub-rede pública em us-east-2c:</strong> 10.0.0.0/20 (4.096 IPs)</li><li><strong>Bloco CIDR da sub-rede privada em us-east-2c:</strong> 10.0.128.0/20 (4.096 IPs)</li></ul>
</blockquote>
<p>Na seção "Gateways NAT", temos alguns pontos importantes. Um <em>gateway</em> NAT permite o acesso da nossa sub-rede privada para a internet. Por exemplo, se quisermos acessar a internet para atualizar uma instância de banco de dados em uma sub-rede privada, precisaremos de um <em>gateway</em> NAT.</p>
<p>No entanto, a partir do momento em que criamos um <em>gateway</em> NAT, <strong>cada acesso será cobrado</strong>! Portanto, não vamos criá-lo. Ou seja, nossa sub-rede privada não terá acesso à internet, mas isso não será um problema para nosso caso. Em um cenário real de produção, é necessário adicionar um <em>gateway</em> NAT (com custos). Logo, vamos manter selecionada a opção "Nenhuma".</p>
<p>Na seção "Endpoints da VPC", não vamos criar nenhum <em>endpoints</em>. Aprenderemos do que se trata esse recurso mais adiante. Por enquanto, vamos manter selecionada a opção "Nenhuma".</p>
<p>Na seção "Opções de DNS", vamos manter selecionadas as duas opções: "Habilitar nomes de host DNS" e "Habilitar resolução de DNS".</p>
<p>A seguir, um resumo das configurações definidas:</p>
<blockquote>
<ul><li><strong>Recursos a serem criados:</strong> VPC e muito mais</li><li><strong>Geração automática da etiqueta de nome</strong><ul><li>Opção "Gerar automaticamente" marcada</li><li><strong>Etiqueta:</strong> infra</li></ul>
</li><li><strong>Bloco CIDR IPv4:</strong> 10.0.0.0/16 (65.536 IPs)</li><li><strong>Bloco CIDR IPv6:</strong> Nenhum bloco CIDR IPv6</li><li><strong>Locação:</strong> Padrão</li><li><strong>Número de zonas de disponibilidade:</strong> 1</li><li><strong>Personalizar AZs:</strong> us-east-2c</li><li><strong>Número de sub-redes públicas:</strong> 1</li><li><strong>Número de sub-redes privadas:</strong> 1</li><li><strong>Gateway NAT:</strong> Nenhuma</li><li><strong>Endpoints da VPC:</strong> Nenhuma</li><li><strong>Opções de DNS</strong><ul><li>Opção "Habilitar nomes de host DNS" marcada</li><li>Opção "Habilitar resolução de DNS" marcada</li></ul>
</li></ul>
</blockquote>
<p>Agora, vamos focar na parte direita da tela, onde temos um fluxo da nossa infraestrutura. Da esquerda para a direita, temos quatro retângulos:</p>
<p><img src="https://cdn1.gnarususercontent.com.br/1/1159682/975f31de-36d6-4732-93ec-64e7ddc4193d.jpg" alt="Fluxo da infraestrutura. A descrição será feita a seguir na transcrição.">  </p>
<p>No primeiro retângulo ("VPC"), temos a VPC chamada "infra-vpc".</p>
<p>No segundo retângulo ("Sub-redes"), temos duas sub-redes na zona de disponibilidade "us-east-2c". A primeira é a rede pública "infra-subnet-public1-us-east-2c" e a segunda é a rede privada "infra-subnet-private1-us-east-2c.</p>
<p>No terceiro retângulo ("Tabelas de rotas"), temos dois elementos. A rede pública se conecta à primeira tabela, chamada "infra-rtb-public". A rede privada se conecta à segunda tabela, chamada "infra-rtb-private1-us-east-2c".</p>
<p>No quarto retângulo ("Conexões de rede"), temos um <em>internet gateway</em> denominado "infra-igw", que se conecta apenas à tabela da rede pública.</p>
<p>Estudaremos mais a respeito futuramente. Por ora, basta entender que é o <em>internet gateway</em> que torna esta rede pública. Em resumo, essa sub-rede pública precisa ser acessível a partir da internet. Na AWS, permitimos o acesso a uma sub-rede vindo da internet por meio de um <em>internet gateway</em>. Dessa forma, permitimos a entrada de dados.</p>
<p>Se tivéssemos selecionado um <em>gateway</em> NAT nas configurações, teríamos uma conexão de rede na sub-rede privada. Assim, a sub-rede privada conseguiria ir até a internet e a AWS cuidaria das configurações de NAT para nós. Como comentamos, o <em>gateway</em> NAT tem um custo, por isso, não vamos adicioná-lo no nosso projeto.</p>
<p><strong>Recapitulando:</strong> criamos uma VPC com uma sub-rede pública e outra privada, ambas em uma única zona de disponibilidade. A sub-rede pública está ligada a um <em>internet gateway</em>, permitindo o acesso vindo a internet.</p>
<p>Dessa forma, conseguiremos fazer um SSH nas máquinas que estejam na sub-rede pública. Na sub-rede privada, essa operação não será possível.</p>
<p>Já revisamos nossa infraestrutura, então vamos clicar no botão "Criar VPC" na parte inferior da tela. Esse processo pode levar um tempo, mas será mais rápido do que criar uma instância.</p>
<p>Com a nossa rede criada com suas sub-redes na zona de disponibilidades, com tabelas de roteamento e <em>internet gateway</em>, o próximo passo é usar tudo isso! No próximo vídeo, vamos excluir as instâncias anteriores e criar outras. Uma na sub-rede pública, outra na sub-rede privada.</p>
                        </div>