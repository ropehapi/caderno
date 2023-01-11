# **MySQL**
## **Introdução**
Bancos de dados nada mais são que mecanismos de armazenamento de dados. Como por exemplo em uma padaria, onde podemos ter fichas com os dados de todos os seus clientes armazenados em uma gaveta, células de todos os seus clientes em uma planilha de excel, ou registros de todos os seus clientes em uma tabela em um servidor de banco de dados digital. Todas essas formas de registrar dados são considerados bancos de dados.

Os bancos de dados digitais podem ser divididos em duas categorias, os bancos de dados relacionais, e os não relacionais. Nesse tópico em questão, trataremos dos bancos de dados relacionais.

### **O que é um banco de dados relacional**
Os bancos de dados relacionais permitem que os dados sejam organizados em tabelas. Essas tabelas permitem que os dados de uma tabela possam se comunicar com os dados de outra tabela, como por exemplo, podemos ter uma tabela para os clientes, e uma tabela para as compras desses clientes, onde as tabelas terão uma relação. Daí, o nome banco de dados relacional.

## **A estrutura de um banco de dados**
- Banco de dados
    - Ferramentas que permitem o armazenamento e manipulação de dados organizados em forma de tabelas.
- Tabelas
    - Forma de orgranização de dados formada por linhas e colunas.
- Colunas
    - Campos que formam um registro.
- Linhas
    - Registros ou tuplas

## **Conceitos de bancos de dados**
### **Visões**
Visões nada mais são do que as consultas feitas no banco de dados, sem necessariamente ser todos os registros com todos os dados de uma tabela. Então quando eu quiser extrair apenas uma certa consulta de dados em específico, basta que eu consulte uma visão para a visualização apenas dos dados que eu quero envés de uma tabela inteira.

### **Índices**
Índices nada mais são que estruturas que gerenciam a ordenação de valores dos campos informados para melhorar a performance de processamento destes campos (Será mais bem abordado a frente).

### **SGBDs**
Sistema gerenciador de banco de dados, ou DBMS (Database Management System) não é um banco de dados, mas sim uma plataforma, um complemento onde um banco de dados roda em cima. Essa plataforma é responsável por cuidar de coisas como os múltiplos acessos, modificações simultâneas, os usuários com acesso ao banco entre outros.

## **SQL**
Structured Query Language nada mais é que uma linguagem estruturada de consulta. Essa linguagem é composta por um conjunto de 5 sublinguagens. São essas sublinguagens:

- DDL (Data definition language)
    - Linguagem de definição de dados
- DML (Data manipulation language)
    - Linguagem de manipulação de dados
- DQL (Data query language)
    - Linguagem de consulta de dados
- DCL (Data control language)
    - Linguagem de controle de dados
- DTL (Data transaction language)
    - Linguagem de transação de dados 

### **DDL**
Essa é a linguagem responsável pela definição dos dados, que tem basicamente três comandos, o `CREATE`, que cria uma estrutura, o `ALTER`, que altera uma estrutura, e o `DROP`, que exclui uma estrutura.

### **DML**
Enquanto a DDL é responsável pela estrutura do banco, a DML é responsável por parte do gerenciamento dos dados que irão popular as estruturas criadas com a linguagem anterior, sendo composta pelos comandos `INSERT`, `UPDATE` e `DELETE`.

### **DQL**
É a que complementa a DML e permite recuperação e leitura dos dados inseridos nas tabelas e estruturas do seu banco de dados. Basicamente, é composta pelo comando `SELECT`, que é o comando que permite recuperar dados do banco. Essa mesma linguagem é a responsável por trabalhar na ordenação e agrupamento dos dados, além de poder fazer operações aritméticas.

### **DCL**
É a linguagem que permite gerenciar quem pode e quem não pode realizar cada uma das consultas apresentadas anteriormente pelas outras linguagens. É composta pelos comandos `GRANT` e `REVOKE`, responsáveis por habilitar acesso a dados e revogar, respectivamente.

### **DTL**
É a linguagem de transação de dados. Uma transação é definida como um conjunto de operações. Nessa linguagem, usamos os comandos `START TRANSACTION`, `COMMIT`, e `ROLLBACK`, responsáveis por iniciar a transação, concretizar a transação, ou anular a transação, respectivamente.

## **Chaves**
### **Chaves primárias (PK)**
Quando uma coluna apresenta valores que não se repetem entre os registros, ela pode ser definida como uma PK, essa caracteristica também é conhecida como identificador único. Em uma tabela de clientes por exemplo, um cpf e um rg podem ser uma chave primaria, da mesma forma como o id do registro em outras ocasiões.

### **Chaves compostas**
Uma chave composta é caracterizada quando é necessário uma ou mais colunas para caracterizar o identificador único da tabela.

### **Chaves estrangeiras (FK)**
Quando uma coluna é utilizada em uma tabela apenas para fazer referencia em outra, ela é uma FK, isso quer dizer que aquela tabela em questão tem relacionamento com outra tabela, e que necessariamente o valor da chave estrangeira deve sim existir na tabela de origem do registro. Por exemplo, em uma tabela de vendas, nós não precisamos armazenar o nome, o rg e o cpf de um vendedor, apenas o identificador que aponta para o registro em outra tabela.

## **Relacionamentos**
### **Relacionamento 1 para 1 (1:1)**
O relacionamento onde para cada registro em uma tabela, pode haver apenas um registro correspondente na tabela relacionada. Por exemplo, cada pessoa, só pode ter uma CNH, e vice versa.

### **Relacionamento 1 para muitos (1:n)**
Onde para cada registro da primeira tabela, pode existir um ou mais correspondentes na segunda tabela, mas para cada registro na segunda tabela existe apenas um registro correspondente na primeira tabela. Por exemplo, uma pessoa pode ter vários carros, mas um carro só pode estar registrado para uma pessoa.

### **Relacionamente muitos para muitos (n:n)**
Para cada registro da primeira tabela, pode existir um ou mais correspondentes na segunda tabela, e vice-versa. Por exemplo, uma pessoa pode praticar uma ou mais profissões, da mesma forma como uma profissão pode ser exercida por uma ou mais pessoas.