<div class="formattedText" data-external-links="">
                                <p>Agora, vamos criar um novo usuário e dá-lo acesso ao <em>console</em>. Com isso, ele poderá manipular arquivos.</p>
<p>Entre a aula passada e esta, o instrutor criou um novo <em>bucket</em>, chamado "rmerces-labs3", seguindo o mesmo método utilizado nos vídeos anteriores. Além disso, ele adicionou os mesmos arquivos do <em>bucket</em> "rmerces-labs2". Esse novo repositório está fechado para acessos públicos. Todas as outras configurações estão no <em>default</em>: o instrutor só criou um novo nome.</p>
<p>Vamos criar um usuário, um grupo e atribuir permissões relacionadas ao <em>bucket</em>. Na <em>AWS</em>, não é possível se registrar apenas ao <em>S3</em>:</p>
<blockquote>
<p>Obs:
Há vários outros serviços que precisamos aprender, como o <em>Identity Access Management (IAM)</em>, responsável por gerenciar usuários e grupos na <em>AWS</em>. Para realmente utilizar o <em>bucket</em>, precisaremos entendê-lo.</p>
</blockquote>
<p>Vamos pesquisar <em>"IAM"</em> na barra de pesquisa do <em>AWS</em> para visitar sua página. Vamos acessar <em>"User groups &gt; Create group"</em>, a primeira opção de <em>"Access management"</em> na barra lateral.</p>
<p>É possível criar grupos, adicionar usuários e editar a <em>policy</em> de uma vez só. Nesse treinamento, porém, estamos aprendendo a fazer essas atividades separadamente. Na página web, vamos inserir o nome do grupo, "s3-view", na caixa de texto da seção <em>"Name the group"</em>. Daremos esse nome a ele porque sua <em>URL</em> pública só dará direito à visualização.</p>
<p>Agora, vamos rolar a página para baixo, até encontrarmos a seção <em>"Attach permissions policies - Optional"</em>. Lá, poderíamos criar a <em>policy</em> de maneira manual, clicando em <em>"Create policy"</em>. Porém, vamos escolher uma das <em>policies</em> disponibilizadas um pouco abaixo.</p>
<p>Vamos pesquisar <em>"S3"</em> na barra de busca acima da lista, para que a lista exiba apenas as <em>policies</em> relacionadas a esse serviço. Vamos selecionar a <em>policy</em> "AmazonS3ReadOnlyAccess", que somente dá acesso de visualização. Depois disso, é hora de clicar em <em>"Create group"</em> para criar o grupo já vinculado à <em>policy</em>.</p>
<p>Ainda não há, porém, usuários no grupo. Vamos criá-los indo à barra lateral para clicar em <em>"Users"</em>, a segunda opção de <em>"Acess management"</em>. Na nova página, vamos clicar em <em>"Add user"</em>, para adicionar usuários. Na seção <em>"Set user details"</em>, vamos inserir o nome do usuário, "s3-user1", na barra de texto à direita de <em>"User name"</em>. </p>
<blockquote>
<p>Obs:
Não é necessário inserir <em>"S3"</em> no nome. O instrutor faz isso por organização. </p>
</blockquote>
<p>Na segunda seção, <em>"Select AWS access type"</em>, vamos definir o tipo de acesso concedido ao usuário que estamos criando. Em <em>"Select AWS credential type"</em>, vamos selecionar a segunda opção, <em>"Password - AWS Management Console access"</em>, que concede acesso via <em>console</em>. </p>
<p>Ainda na segunda seção, mas em <em>"Console password"</em>, vamos selecionar a primeira opção, para gerarmos uma senha automaticamente. Por fim, vamos desmarcar o <em>box</em> de <em>"Require password reset"</em>, para que não seja necessário criar uma nova senha no primeiro acesso. </p>
<p>Clicando em <em>"Next: Permissions"</em>, vamos associar o usuário ao grupo que criamos anteriormente. No caso, o grupo "s3-view". Vamos clicar em <em>"Next: Tags"</em> e, nessa etapa, não faremos nada. Apenas avançaremos para <em>"Next: Review"</em>, outra página que vamos ignorar. Basta clicar em <em>"Create user"</em>, no final da página, para que o usuário seja criado.</p>
<blockquote>
<p>Obs:
Lembre de anotar a senha que foi gerada automaticamente, porque não será possível visualizá-la no futuro.</p>
</blockquote>
<p>É possível, nesta mesma página, fazer o download do <em>csv</em>, clicando no botão <em>"Download .csv"</em>. Agora que o usuário está criado, vamos aprender a acessar o <em>console</em> da <em>AWS</em>. Para isso, vamos acessar "Users &gt; s3-user1 &gt; Security credentials". Em <em>"Summary"</em>, vamos encontrar a <em>URL</em> de acesso ao <em>console</em>.</p>
<p>Vamos copiá-la em outro <em>browser</em>, já que vamos alternar entre usuários. Seremos redirecionados a uma página de login, que solicita o nome do usuário e sua senha. Na primeira caixa de texto, vamos inserir "s3-user1". E, na segunda, a senha automática que foi gerada anteriormente. Depois disso, basta fazer o login.</p>
<p>Esse é o mesmo console da <em>AWS</em>, mas com algumas restrições. Vamos buscar por <em>"S3"</em> na barra de pesquisa. Clicando na primeira opção, somos levado à página que dá acesso aos <em>buckets</em>. </p>
<blockquote>
<p>Obs:
Não confunda <em>IAM</em> com <em>policy</em>.</p>
</blockquote>
<p>Se acessarmos "rmerces-labs3 &gt; img1.jpg &gt; Download", vamos conseguir baixar e visualizar a imagem. Agora, vamos tentar provisionar alguns recursos para esse usuário, clicando em <em>"Create bucket"</em> para criar um novo repositório.  Vamos dar o nome "rmerces-labs4" ao novo <em>bucket</em>, mantendo as outras opções no padrão, e criá-lo.</p>
<p>Quando tentarmos fazer isso, não vamos conseguir e visualizaremos uma mensagem de falha, porque este usuário não tem permissão para fazê-lo. Agora, vamos tentar subir uma instância, buscando por <em>"EC2"</em> na barra de pesquisa e clicando na primeira opção.</p>
<p>Nesta página, de início, já vamos nos deparar com uma série de avisos de erro. Se preenchermos todas as opções para criar a instância, não conseguiremos, assim como na tentativa de criação do <em>bucket</em>. Por fim, vamos voltar ao <em>bucket</em> "rmerces-labs1".</p>
<p>Lá, vamos selecionar a opção <em>"Upload"</em> e adicionar outro arquivo ao repositório. No vídeo, o instrutor fez o upload do vídeo "lightsaber_story.mp4". Mais uma vez, veremos nossa tentativa falhar, porque não temos permissão para fazer isso. O acesso que concedemos a esse usuário é apenas de visualização.</p>
<p>Aprendemos que é possível criar grupos e usuários com permissões diferentes, dando acesso a áreas específicas do <em>bucket</em>.</p>
<p>No próximo vídeo, vamos criar outro usuário, gerenciar suas permissões e começar a trabalhar com <em>CLI</em>.</p>
                        </div>