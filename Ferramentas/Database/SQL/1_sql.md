# **SQL**
## **Introdução**
Bancos de dados nada mais são que mecanismos de armazenamento de dados. Como por exemplo em uma padaria, onde podemos ter fichas com os dados de todos os seus clientes armazenados em uma gaveta, células de todos os seus clientes em uma planilha de excel, ou registros de todos os seus clientes em uma tabela em um servidor de banco de dados digital. Todas essas formas de registrar dados são considerados bancos de dados.

Os bancos de dados digitais podem ser divididos em duas categorias, os bancos de dados relacionais, e os não relacionais. Nesse tópico em questão, trataremos dos bancos de dados relacionais.

### **O que é um banco de dados relacional**
Os bancos de dados relacionais permitem que os dados sejam organizados em tabelas. Essas tabelas permitem que os dados de uma tabela possam se comunicar com os dados de outra tabela, como por exemplo, podemos ter uma tabela para os clientes, e uma tabela para as compras desses clientes, onde as tabelas terão uma relação. Daí, o nome banco de dados relacional.

## **A estrutura de um banco de dados**
- Servidor de banco de dados
    - Servidor que provê as conexões e gerencia os acessos aos bancos. (MySQL, Postgres etc)
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

### **Relacionamento muitos para muitos (n:n)**
Para cada registro da primeira tabela, pode existir um ou mais correspondentes na segunda tabela, e vice-versa. Por exemplo, uma pessoa pode praticar uma ou mais profissões, da mesma forma como uma profissão pode ser exercida por uma ou mais pessoas.

## **Tipos de dados**
### **Booleano e numéricos**
Dados do tipo booleano se enquadram em um tipo numérico pois serão armazenados no banco como um 0 ou 1, sendo 0 para falso e 1 para verdadeiro.
Já os dados de tipo numérico podem variar de acordo com sua ordem de grandeza, descritas na tabela abaixo.
![Tabela de valores dos tipos booleano e numéricos](/src/img/booleano-e-numericos.png)

### **Strings**
Em se tratando de strings, temos duas maneiras de armazena-las, sendo essas maneiras o `CHAR` e o `VARCHAR`. Enquanto o `CHAR` ocupará no banco a quantidade de caracteres informado na definição da coluna (mesmo que o registro de fato tenha menos caracteres) com caracteres vazios, o `VARCHAR` ocupará em banco apenas a quantidade necessária de caracteres do seu registro.

### **Data e hora** 
Registros que armazenem data e hora podem ser avaliados entre os tipos da tabela abaixo.
![Tabela de intervalos e valores de date e hora](/src/img/data-e-hora.png)

### **Outros tipos de dados**
- Blob
- Text
- Redes
- Monetários
- Geométricos

***Para visualizar uma tabela com todos os tipos de dados, basta acessar [esse](https://github.com/ropehapi/caderno/tree/main/src/Tabela_de_tipos_de_dados.pdf) diretório do repositório.

## **Atributos**
- Null / Not null
- Unsigned
- Auto-increment
- Zerofill
---
## **DDL**
Linguagem de definição de dados, responsável por manipular a estrutura do banco, através dos comandos abaixo.

- CREATE: Cria uma estrutura
- ALTER: Altera uma estrutura
- DROP: Excluir uma estrutura

        CREATE DATABASE nome_banco;
        ALTER DATABASE nome_propriedade;
        DROP DATABASE nome_banco;

        CREATE TABLE nome_tabela (nome tipo_dado atributos, nome_1 tipo_dado atributos);
        ALTER TABLE nome_tabela .....;
        DROP TABLE nome_tabela;

        CREATE INDEX nome ON tabela_e_coluna;
        ALTER INDEX nome_propriedade;
        DROP INDEX nome;

## **DML**
Linguagem de manipulação de dados, responsável por manipular os registros em nosso banco, composta pelos comandos abaixo:

- INSERT: Insere um registro
- UPDATE: Atualiza um registro
- DELETE: Exclui um registro

        INSERT INTO nome_tabela (nome_coluna_1, nome_coluna_2) values (valor_coluna_1, valor_coluna_2);
        UPDATE nome_tabela set nome_coluna = valor_coluna WHERE id = 1;
        DELETE FROM nome_tabela WHERE id = 10;

## **DCL**
Linguagem de controle de acesso, forma de garantir que somente pessoas autorizadas possam realizar ações com os dados.

- Níveis de acceso:
    - Banco de dados, tabelas, colunas, registros
- Niveis de ação:
    - Gerenciar estruturas, gerenciar dados, ler dados

A DCL é composta pelos seguintes comandos:

- CREATE: Cria um usuário
- DROP: Deleta um usuário
- GRANT: Habilita acessos
- REVOKE: Revoga acessos

## **DTL**
Data transaction language é o nome que se dá à linguagem responsável pelas transações, método utilizado para manter a consistência de um banco de dados.

### **Transações ACID**
ACID, um acrônimo para atomicidade, consistência, isolamento e durabilidade, é um padrão transacional, que permite maior confiabilidade dos registros em nosso banco. Explicando letra por letra:

- Atomicidade: Ou tudo dá certo ou nada
- Consistência: Garante as regras do banco
- Isolamento: Fecha o acesso aos dados durante a operação
- Durabilidade: Confirma todas as ações

A DTL é composta pelos seguintes comandos:

- START TRANSACTION: Inicia a transação
- COMMIT: Concretiza a transação
- ROLLBACK: Anula a transação

## **DQL**
Linguagem de consulta de dados, composta por um único comando, o select, que deve ser complementado pelos mais diversos tipos de filtragem que existem no SQL.

- SELECT: Seleciona os registros a exibir

        SELECT * FROM nome_tabela

### **Filtros de seleção**
- Registros selecionados: WHERE
- Operadores relacionais: 
     - =, !=, \>, <, \>=, <=, IS NULL, IS NOT NULL, BETWEEN, LIKE
- Operadores lógicos:
    - AND, OR, NOT

## **Relacionamentos e visões**
A partir de Informações relacionadas entre si, que geralmente possuem campos em comum, podemos manipular nossas consultas de forma a nos retornar os mais variados tipos de visões.

### **Join**
Usado quando queremos trazer em uma consulta os dados de registros de duas tabelas distintas, podemos usar o `JOIN` quando as tabelas possuírem um campo em comum, da seguinte maneira:

    SELECT c.nome_carro,
           m.nome_motorista 
    FROM carro c 
    JOIN motorista m ON c.motorista_id = m.id;

### **Tipos de Join**
Há varios tipos de join, como explicados na imagem abaixo.
![Tipos de join](/src/img/tipos_de_join.png)

## **Funções**
- Funções de agregração
    - COUNT, SUM, AVG, MAX, MIN
- Funções de paginação
    - DISTINCT, ORDER BY, LIMIT, OFFSET
- Funções de agrupamento
    - GROUP BY, HAVING

## **Subqueries**
Subqueries são consultas dentro do resultado de outra consulta armazenada em memória.

- IN/NOT IN

        SELECT nome FROM funcionarios
        WHERE departamento in(
            SELECT departamento FROM funcionarios
            GROUP BY departamento HAVING AVG(salario) > 1500 
        );

## **Stored procedures**
Recurso que possibilita armazenar no servidor de BD códigos SQL para serem executados em determinado momento.


- CREATE PROCEDURE: Cria uma procedure
- EXECUTE: Executa uma procedure
- DROP PROCEDURE: Exclui uma procedure

        CREATE PROCEDURE nome;
        EXECUTE nome;
        DROP PROCEDURE nome;

### **Exemplo:**
    CREATE PROCEDURE GetCarDesc
    AS
    BEGIN
    SET NOCOUNT ON
    SELECT C.CarID,C.CarName,CD.CarDescription  FROM 
    Car C
    INNER JOIN CarDescription CD ON C.CarID=CD.CarID
    END



## **Triggers**
Eventos que disparam códigos SQL

### **Tipos de triggers**
- BEFORE/AFTER INSERT
- BEFORE/AFTER UPDATE
- BEFORE/AFTER DELETE

- CREATE TRIGGER: Cria uma trigger
- DROP TRIGGER: Exclui uma trigger

        CREATE TRIGGER nome TIPO ON tabela
        DROP TRIGGER nome