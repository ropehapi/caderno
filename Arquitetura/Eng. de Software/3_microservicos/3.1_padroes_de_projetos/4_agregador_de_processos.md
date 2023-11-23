[00:00] Como eu falei, vamos conversar um pouco sobre agregar processos e o que isso quer dizer. Imagina os serviços de domínio e os serviços de negócio. Um serviço de negócio agrega vários serviços de domínio para termos um processo completo.

[00:20] Já um agregador de processos é algo que precisamos agregar diversos desses processos. Então de novo, eu tenho um serviço de domínio e eu tenho um serviço de negócio que agrega eles. E eu posso ter um agregador de processos, que agrega diversos serviços de negócio.

[00:39] Isso é bem menos comum, como você pode imaginar e vai ser utilizado quando temos processos mais complexos, processo que dependem de vários outros processos.

[00:49] Então imagina que, por exemplo, na hora de renovar a matrícula de um aluno da Alura eu realize todo o processo de matrícula, o que uma matrícula faz? Garante que o aluno está cadastrado, então insere o aluno ou atualiza se for necessário, insere o jogador, garante que ele está com os pontos atualizados, realiza o pagamento desse aluno, faz a matrícula financeira.

[01:09] Só que além de matricular um aluno, eu preciso também nessa renovação de matrícula executar um processo de business intelligence, por exemplo, de data analytics ou qualquer nome bonito, ou seja, eu vou pegar dados de tudo que o aluno fez, gerar relatórios bonitos, gerar métricas, para informar para ele tudo que ele fez no ano letivo anterior por exemplo.

[01:30] Então eu tenho mais de um processo complexo em um processo maior. Então para isso vamos utilizar o process aggregator pattern. É um padrão onde temos um tipo de serviço ainda mais de alto nível.

[01:43] Então de novo, um serviço de negócio agrega serviços de domínio, um process aggregator, um agregador de processos agrega serviços de negócio. Então serviços de domínio, serviços de negócio, agregadores de processo. Então são similares no conceito, mas vamos agregar tipos diferentes.

[02:05] E a partir disso vamos fazer as chamadas para os serviços necessários e montar a resposta correta baseada nas respostas que recebemos de cada um dos processos, de cada um dos business services.

[02:16] Então esse tipo de serviço, um process aggregator, ele pode e deve ter alguma lógica de processamento. Porque por exemplo, imagina essa renovação de matrícula, ele faz a matrícula do aluno e recebe uma resposta, faz uma requisição para o serviço de analytics e recebe uma resposta.

[02:32] Nesse serviço de matrícula pode ter mensagens informando para o aluno “Bem-vindo, seu cadastro foi realizado”, alguma coisa do tipo e nesse serviço de métricas temos todos os dados do anterior.

[02:45] Então não faria sentido eu jogar isso tudo na resposta para o cliente, porque eu estou dando bem-vindo para ele, mas estou falando para ele tudo que ele fez anteriormente.

[02:53] Então esse processamento juntaria as respostas, removeria os detalhes de "bem-vindo, conheça a Alura" e trocaria, por exemplo, para “obrigado por continuar conosco”, algum tipo de mensagem desse tipo. Então existe um certo processamento de juntar os dados, retirar o que não faz sentido, adicionar algo que faça mais sentido.

[03:17] Claro que esse “exibir mensagem”, isso não estaria em um serviço de tão alto nível, isso estaria mais perto do cliente, alguma coisa do tipo. Mas só para termos uma ideia de que nós temos normalmente processamento nesse tipo de agregador.

[03:30] Porque para começar precisamos pelo menos unir a resposta de diversos serviços, isso por si só já é algum processamento. Então isso não vai ser simplesmente chama e devolve, não é só um proxy, ele realmente processa as respostas para unir.

[03:47] E no processo de construirmos um agregador de processos, precisamos pensar em algumas coisas. E conforme construímos um agregador, acabamos definindo um novo modelo para o nosso sistema, porque esse novo modelo, esse novo subdomínio, esse novo mini mundo, o que ele vai fazer é representar esses dados agregados.

[04:09] Então nós vamos ter, por exemplo, um domínio de renovação de matrícula, isso se torna por si só um domínio, um novo modelo, uma representação de algo que existe no nosso negócio.

[04:19] Não só um processo, mas um dado, uma renovação de matrícula. E a partir desse modelo que vamos pensar na API. Então nós temos, por exemplo, api.alura.com.br/renovacaodematriculas e passa o ID do aluno que vamos renovar. E a partir disso os processos são desencadeados e tudo é gerado.

[04:38] Então quando construímos um agregador, um novo modelo é criado, nós criamos como se fosse um subdomínio, um mini mundo só para esse grande processo que vamos criar. Então a ideia é relativamente simples, a criação é mais complexa, porque envolve mais de um processo, mas a ideia em si é simples.

[04:59] Agora voltando para aquela ideia de gateway, de ter um ponto de entrada, vamos conversar um pouco sobre aquilo que comentamos de gateways específicos para cada cliente. Só que vamos falar sobre isso no próximo vídeo.