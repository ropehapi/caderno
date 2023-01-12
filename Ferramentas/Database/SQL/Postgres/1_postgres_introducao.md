# **Postgres SQL**
*Antes de mais nada: Esse caderno dispõe de um tópico sobre SQL [aqui](https://github.com/ropehapi/caderno/Database/SQL).*

As anotações a seguir se tratam de funcionalidades e ferramentas específicas do Postgres.

## **Criando uma tabela**
    CREATE TABLE treinamento.funcionario(
        id bigserial,
        nome character varying(60),
        departamento character varying(60),
        salario numeric(11,2),
        constraint pk_funcionario primary key (id)
    );

*Ao passar o parametro `bigserial` no DDL, o Postgres entende que se trata de uma coluna `bigint` com `auto_increment`.

### **Sequences**
Toda tabela tem uma sequence, que é uma estrutura separada da tabela que serve como um contador. Como a propriedade de auto increment do MySQL por exemplo.

## **Consultando registros**
### **Definindo valores padrão**
*O `coalesce` nada mais é que um ternário onde se a coluna for null, ele atribuirá um valor default.

### **Conversão de tipos**
*Afim de que possamos converter nossos dados de saída, o Postgres oferece duas maneiras de fazermos isso, através do `cast`, passando a coluna e o tipo desejado, ou através do operador coluna`::tipo`.

    select id,
           nome,
           coalesce(departamento, 'A definir') departamento,
           cast(salario as text),
           salario::text,
           salario::bigint
    from treinamento.funcionario

TODO:: Comentar o having e as funções.

    select departamento,
           sum(salario) total_custo,
           avg(salario)::numeric(11,2) media_salarial,
    from treinamento.funcionario
    --group by 1
    group by departamento
    having avg(salario) >= 1000

TODO:: Comentar o partition by

    select  id,
            nome,
            departamento,
            salario,
            avg(salario) over(partition by departamento)::numeric(11,2) media_salarial_setor,
            sum(salario) over(partition by departamento)::numeric(11,2) total_custo_setor,
            abg(salario) filter(where salario < 1000) over(partition by 1)::numeric(11,2) media_salarial_salario_menor_10k
    from treinamento.funcionario

### **Ranqueando registros**
Afim de que possamos ranquear uma consulta a partir de um critério específico, podemos usar a função `rank`.

    select 'ID Brasil',
           id,
           nome,
           departamento,
           salario,
           rank() over(partition by departamento order by desc, id) rank
    from treinamento.funcionario

### **Armazenando consultas em memória**
No postgres, podemos também armazenar o resultado de uma consulta em memória e acessa-la através de uma variável com o `with` da seguinte maneira:

    with t_tag(id, tipo_tag_id, valor, tipo_tag_descricao) as (
        select tag.id,
               tag.tipo_tag_id,
               tag.valor,
               tag.descricao
        from movimentacao.tag_item_personalizacao tag
        join tipo_tag tp on tp.id = tag.tipo_tag_id
        where tag.empresa_id = any(etl.obter_empresas_por_dominio(4,'TagItemPersonalizacao))
        limit 50
    )

    select id,
           tipo_tag_id,
           valor,
           tipo_tag_descricao
    from t_tag



TODO::Pesquisar sobre recursividade

## **Manipulando dados**
### **Inserindo dados vindos de outra consulta**
Podemos inserir dados em massa a partir de um insert seguido de um select em outra tabela onde queremos copiar os dados.

    insert into treinamento.funcionario(nome, departamento, salario)
    select nome, origem, 1000
    from movimentacao.pessoa
    limit 10

### **Fluxos de controle do script**
Assim como em uma linguagem de programação, podemos fazer uma validação de integridade através do `on conflict` (que valida por exemplo se um registro pode ou não ser gravado, no caso de uniques etc) e definir o que fazer a depender do resultado, como por exemplo não fazer nada com a instrução `do nothing` ou qualquer outra operação (por exemplo dar update no registro pré-existente).

    insert into treinamento.funcionario(nome, departamento, salario)
    values('Pedro Y', 'Dev', 400)
    on conflict (departamento, nome)
    do nothing

    ou

    do update set salario = 800
    where treinamento.funcionario.salario <= 600