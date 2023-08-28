# **Chaves**
## **Chaves primárias (PK)**
Quando uma coluna apresenta valores que não se repetem entre os registros, ela pode ser definida como uma PK, essa caracteristica também é conhecida como identificador único. Em uma tabela de clientes por exemplo, um cpf e um rg podem ser uma chave primaria, da mesma forma como o id do registro em outras ocasiões.

## **Chaves compostas**
Uma chave composta é caracterizada quando é necessário uma ou mais colunas para caracterizar o identificador único da tabela.

## **Chaves estrangeiras (FK)**
Quando uma coluna é utilizada em uma tabela apenas para fazer referencia em outra, ela é uma FK, isso quer dizer que aquela tabela em questão tem relacionamento com outra tabela, e que necessariamente o valor da chave estrangeira deve sim existir na tabela de origem do registro. Por exemplo, em uma tabela de vendas, nós não precisamos armazenar o nome, o rg e o cpf de um vendedor, apenas o identificador que aponta para o registro em outra tabela.

# **Relacionamentos**
## **Relacionamento 1 para 1 (1:1)**
O relacionamento onde para cada registro em uma tabela, pode haver apenas um registro correspondente na tabela relacionada. Por exemplo, cada pessoa, só pode ter uma CNH, e vice versa.

## **Relacionamento 1 para muitos (1:n)**
Onde para cada registro da primeira tabela, pode existir um ou mais correspondentes na segunda tabela, mas para cada registro na segunda tabela existe apenas um registro correspondente na primeira tabela. Por exemplo, uma pessoa pode ter vários carros, mas um carro só pode estar registrado para uma pessoa.

## **Relacionamento muitos para muitos (n:n)**
Para cada registro da primeira tabela, pode existir um ou mais correspondentes na segunda tabela, e vice-versa. Por exemplo, uma pessoa pode praticar uma ou mais profissões, da mesma forma como uma profissão pode ser exercida por uma ou mais pessoas.