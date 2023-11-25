<div class="formattedText" data-external-links="">
                                <p>O vídeo anterior foi longo e denso, porque passamos por cada uma das configurações. Recomendamos que você leia detalhadamente essas configurações, este é o momento ideal para você reservar um tempo para ler e entender tudo. Quando você for colocar um banco de dados em produção, em um cenário real, será muito vantajoso já conhecer um pouco de tudo.</p>
<p>Vale lembrar que a Amazon adicionará novas opções no futuro e manter-nos atualizados será mais fácil que esse momento inicial em que estamos aprendendo conceitos mais básicos.</p>
<p>A seguir, vamos explorar o Amazon Aurora.</p>
<h2>Amazon Aurora</h2>
<p>No console da Amazon, no painel do RDS, vamos acessar "Banco de dados" no menu à esquerda e clicar no botão "Criar banco de dados", como fizemos na aula anterior.</p>
<p>Na seção "Tipos de mecanismos", temos a opção Amazon Aurora, que é como se fosse outro gerenciador de banco de dados, parecido com MySQL e PostgreSQL. A diferença é que é um banco de dados criado especificamente para rodar na AWS. Ele é extremamente otimizado para ser executado nesse tipo de ambiente. Além disso, é compatível com MySQL e PostgreSQL.</p>
<p>Então, vamos imaginar o seguinte cenário: criamos uma <em>start-up</em> e utilizamos o banco de dados MySQL. Em dado momento, o volume de dados começou a ser um problema, precisamos de mais espaço, pois a aplicação está crescendo.</p>
<p>Para cenários em que há uma aplicação com um banco de dados grande trafegando muitas informações, é interessante cogitar o uso do Amazon Aurora. Afinal, ele é otimizado para esse tipo de ambiente, é bem mais performático, e é compatível com os bancos que já conhecemos.</p>
<p>Clicando na opção "Amazon Aurora", podemos selecionar entre uma edição compatível com MySQL ou com PostgreSQL. Ou seja, todas as nossas <em>queries</em> SQL que funcionavam no MySQL continuarão funcionando no Amazon Aurora.</p>
<p>Ao clicar em "Amazon Aurora", uma descrição é exibida na lateral direita da tela. Dessa forma, conseguimos aprofundar nossos estudos sobre AWS sem precisar sair da tela do recurso:</p>
<blockquote>
<p>O Amazon Aurora é um banco de dados de nível corporativo compatível com MySQL e PostgreSQL que começa em &lt;$1/dia.</p>
<p>Até cinco vezes o throughput do MySQL e três vezes o throughput do PostgreSQL.
Até 128TB de armazenamento SSD com escalabilidade automática</p>
<p>Seis formas de replicação em três zonas de disponibilidadade</p>
<p>...</p>
</blockquote>
<p>Em outras palavras, conseguimos trafegar uma quantidade de dados até cinco vezes maior que o seu MySQL otimizado e até três vezes maior que o seu PostgreSQL otimizado! Ganhamos em performance e escalabilidade, lidando com dados mais robustos.</p>
<p>A ideia do Amazon Aurora é ser um gerenciador de banco de dados compatível com MySQL ou PostgreSQL, com uma performance superior, pois é otimizado para rodar nesse ambiente. Se você tem um cenário de muito volume de dados, recomenda-se o Amazon Aurora.</p>
<p>No próximo vídeo, vamos conversar um pouco sobre a precificação do RDS. Afinal, a parte de custos é muito importante para quem faz gestão de ambientes em nuvem.</p>
                        </div>