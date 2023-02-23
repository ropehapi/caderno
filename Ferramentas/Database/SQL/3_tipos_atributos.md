# **Tipos de dados**
## **Booleano e numéricos**
Dados do tipo booleano se enquadram em um tipo numérico pois serão armazenados no banco como um 0 ou 1, sendo 0 para falso e 1 para verdadeiro.
Já os dados de tipo numérico podem variar de acordo com sua ordem de grandeza, descritas na tabela abaixo.
![Tabela de valores dos tipos booleano e numéricos](/src/img/booleano-e-numericos.png)

## **Strings**
Em se tratando de strings, temos duas maneiras de armazena-las, sendo essas maneiras o `CHAR` e o `VARCHAR`. Enquanto o `CHAR` ocupará no banco a quantidade de caracteres informado na definição da coluna (mesmo que o registro de fato tenha menos caracteres) com caracteres vazios, o `VARCHAR` ocupará em banco apenas a quantidade necessária de caracteres do seu registro.

## **Data e hora** 
Registros que armazenem data e hora podem ser avaliados entre os tipos da tabela abaixo.
![Tabela de intervalos e valores de date e hora](/src/img/data-e-hora.png)

## **Outros tipos de dados**
- Blob
- Text
- Redes
- Monetários
- Geométricos

***Para visualizar uma tabela com todos os tipos de dados, basta acessar [esse](https://github.com/ropehapi/caderno/tree/main/src/Tabela_de_tipos_de_dados.pdf) diretório do repositório.

# **Atributos**
- Null / Not null
- Unsigned
- Auto-increment
- Zerofill