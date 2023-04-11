# **Pirâmide de testes**
![Pirâmide de testes](/src/img/piramide_de_testes.png)

Tendo em vista que já é sabido que testes de software são importantes e necessários, vamos falar um pouco sobre a pirâmide de testes, e quais os tipos de testes de software e suas finalidades.

## **Os testes de unidade**
Sendo a base da nossa pirâmide, os testes unitários devem ser os testes de maior quantidade no nosso sistema.

Um teste de unidade é um teste que verifica o funcionamento da menor unidade possível e testável do meu sistema, por um método público de uma classe.

![Comportamento de um teste unitario](/src/img/comportamento_teste_unitario.png)

Para que esse tipo de teste possa ser realizado, em um sistema por exemplo, uma classe tem várias dependências. Dessa maneira, essa pecinha verde representa a classe ou método que estamos testando, e os pedacinhos amarelos são as classes das quais a classe testada depende.

Dessa forma, para testar essa classe, precisamos de todas as classes amarelas das quais ela depende.

Assim, existem técnicas para a realização desses testes, sendo uma dessas técnicas os dublês de teste, que consiste em criar de alguma forma uma instância de uma classe que seja reconhecida pela nossa unidade sendo testada, porém que não seja a classe real, e sim uma classe controlada com o comportamento previsto no momento do teste para que não afete seu comportamento. Não entrarei no mérito de explicar mais sobre essas técnicas pois elas serão abordadas logo mais.