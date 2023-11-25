<div class="formattedText" data-external-links="">
                                <p>Já vimos quanto custa usar o AWS, mas como podemos limitar os valores cobrados? Não podemos limitá-los, mas podemos emitir avisos para serviços não inclusos no Tier Gratuito ou para quando um serviço atinge um determinado valor. Assim, evitamos custos inesperados.</p>
<p>Agora, abriremos o Console do AWS Budget para criarmos um aviso.</p>
<p>Com a página do Console aberta no navegador, escreveremos "budget" (orçamento, em inglês) na barra de busca no topo da página. Selecionaremos a opção "AWS Budgets", que surgiu na tela a partir da nossa busca.</p>
<h3>Orçamento simplificado</h3>
<p>Com a página do AWS Budgets aberta, clicaremos no botão "Criar um orçamento", no centro da página. Nas opções para o campo "Configuração de orçamento", podemos usar um modelo simplificado ou personalizá-lo. Recomendamos usar o modelo simplificado para quem usará o tier gratuito. Manteremos essa opção marcada por enquanto.</p>
<p>A seguir, em "Modelos", manteremos a opção "Orçamento de gasto zero" marcada. Essa opção gera uma notificação quando os gastos excedem os limites do nível gratuito da AWS.</p>
<p>Logo abaixo, no campo "Orçamento de gasto zero - modelo", temos um nome genérico para o orçamento ("My Zero Spending Budget" ou "Meu Orçamento de Gasto Zero"). No campo "Destinatários de e-mail", indicaremos os e-mails de quem receberá o aviso. Feito isso, podemos clicar em "Criar orçamento", no fim da página.</p>
<p>O orçamento está criado! Se gastarmos qualquer valor acima de zero, receberemos um aviso no e-mail.</p>
<h3>Orçamento personalizado</h3>
<p>No entanto, em alguns casos, usaremos serviços que não estão inclusos no tier gratuito. Como fazemos para não esquecer desses serviços?</p>
<p>Criaremos outros orçamento para isso. No primeiro campo (Configuração do orçamento), selecionaremos a opção "Personalizar (avançado)". O formulário será modificado para compreender cinco etapas diferentes.</p>
<p>Rolando a página para baixo, observaremos que o campo "Tipos de orçamento" está preenchido em "Orçamento de custos - Recomendado", sendo essa a única opção disponível. Clicaremos no botão "Próximo", no fim da página.</p>
<p>A etapa 2 corresponde à definição do valor de orçamento. Nela, poderemos incluir o nome do orçamento no campo "Detalhes". Chamaremos esse orçamento de "Limite 5,00".</p>
<p>Mais abaixo, no campo "Período", podemos escolher a periodicidade diária, mensal, trimestral ou anual. Escolheremos a opção "Mensal", limitando o nosso gasto a USD 5,00 por mês.</p>
<p>Em "Tipo de renovação do orçamento", podemos selecionar a opção "Orçamento recorrente", em que o orçamento é renovado no primeiro dia de cada mês, ou "Orçamento prestes a expirar". Nessa segunda opção, o orçamento expira e é renovado só quando a pessoa usuária selecionar.</p>
<p>Manteremos a opção "Orçamento recorrente" selecionada. Assim, sempre que o orçamento ultrapassar USD 5,00, receberemos um aviso.</p>
<p>Em "Método de orçamento", temo as opções:</p>
<ul><li>"Corrigido", correspondente ao valor que realmente foi gasto;</li><li>"Planejado", uma estimativa da AWS para o quanto gastaremos até o fim do mês;</li><li>"Ajuste automático (novo)".</li></ul>
<p>Selecionaremos a opção "Corrigido". Em "Insira o valor orçado", escreveremos "5.00".</p>
<p>Em "Escopo do orçamento", podemos escolher "Todos os serviços da AWS (recomendado)" ou "Filtrar dimensões de custo para AWS específicas". Deixaremos a opção recomendada marcada. Avançaremos para a próxima etapa clicando no botão "Próximo", no fim da página.</p>
<p>A etapa 3 permite a configuração dos alertas. Ela aparecerá com o texto inicial "Nenhum limite de alerta criado". Logo abaixo, clicaremos no botão "Adicionar um limite de alerta".</p>
<p>Com isso, um novo campo se abrirá, permitindo definir quando o alerta deve ser acionado. No primeiro campo de texto, devemos inserir um número. O segundo permite a seleção de "% do valor orçado" ou "Valor absoluto". Se escrevermos "80" no primeiro campo e escolhermos a opção "% do valor orçado", estamos dizendo que queremos receber um alerta quando o orçamento alcançar 80% do previsto, que corresponde a USD 4,00.</p>
<p>Também é possível alterar o acionador entre valor "Real" e "Previsto". Assim, se mantermos os 80% do valor orçado na categoria Real, isso implica que o valor foi realmente gasto. Se tivermos selecionado "Previsto", isso diz respeito apenas à previsão do AWS.</p>
<p>Logo abaixo, temos um campo para inserir os Destinatários de e-mail, com o endereço eletrônico das pessoas que receberão o alerta. A seguir, clicaremos no botão "Próximo" no fim da página. Voltaremos a página anterior e visualizaremos as informações gerais do alerta que acabamos de criar. Você pode criar quantos alertas quiser.</p>
<p>Ao clicarmos em "Próximo", aparecerá a página de revisão do orçamento. Após revisar as informações, clicaremos em "Criar orçamento".</p>
<p>Com isso, temos dois orçamentos prontos: um que nos avisa quando saímos do tier gratuito e outro para quando alcançarmos o limite de USD 5,00 no mês.</p>
<p>O próximo passo é finalizar os serviços em execução, reduzindo o nosso custo mensal. Vamos lá?</p>
                        </div>