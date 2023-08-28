# **Stored procedures**
Recurso que possibilita armazenar no servidor de BD códigos SQL para serem executados em determinado momento.


- CREATE PROCEDURE: Cria uma procedure
- EXECUTE: Executa uma procedure
- DROP PROCEDURE: Exclui uma procedure

        CREATE PROCEDURE nome;
        EXECUTE nome;
        DROP PROCEDURE nome;

## **Exemplo:**
    CREATE PROCEDURE GetCarDesc
    AS
    BEGIN
    SET NOCOUNT ON
    SELECT C.CarID,C.CarName,CD.CarDescription  FROM 
    Car C
    INNER JOIN CarDescription CD ON C.CarID=CD.CarID
    END



