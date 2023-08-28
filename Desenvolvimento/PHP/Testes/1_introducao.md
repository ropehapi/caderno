# **Testes automatizados com PHP**
*Antes de mais nada: Recomendo que antes de começar, você leia o [tópico teórico sobre testes](https://github.com/ropehapi/caderno/tree/main/Base/Eng.%20de%20Software/Testes%20e%20qualidade).*

Antes de entrarmos propriamente ao assunto, vamos a uma pergunta: em algum momento você já escreveu um código que não funciona? Eu já, e muitas vezes só descobri isso quando o código já estava em produção, sendo executado pelo cliente. Essa é uma situação desagradável, afinal não queremos ter um cliente insatisfeito.

Existem algumas formas de mitigar esse problema, e a principal delas seria testarmos mais o nosso sistema. Entretanto, testes levam tempo, e sabemos que tempo é dinheiro. Imagina termos que testar todo o sistema a cada nova funcionalidade, já que ela tem o potencial de quebrar várias outras (esmo que não sejam muito relacionadas)?

Refletindo sobre esse cenário, é interessante termos testes automatizados. Mas antes de abordarmos a automatização, você sabe o que são testes de unidade (ou testes unitários)? São simplesmente testes que verificam o nosso código, ignorando se nosso visual está bonito ou se o banco de dados está funcionando.

Inclusive, existe um conceito chamado [pirâmide de testes](https://github.com/ropehapi/caderno/blob/main/Base/Eng.%20de%20Software/Testes%20e%20qualidade/3_piramide_de_testes.md), e ela indica a proporção de testes que precisamos escrever. Na base da pirâmide, que é a parte mais larga, se encontram os testes de unidade, afinal eles são mais rápidos de executar, são mais baratos e mais fáceis de escrever e tão um feedback instantâneo. Sendo assim, se tivermos quebrado alguma coisa no código, perceberemos imediatamente.