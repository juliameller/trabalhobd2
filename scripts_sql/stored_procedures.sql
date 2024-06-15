-- Registrar Produção Diária
CREATE OR ALTER PROCEDURE registrar_producao_diaria(@id_produto INT, @data DATE, @quantidade INT) AS 
BEGIN
    DECLARE @producao_existente INT;

    -- Verificar se já existe um registro para esse produto na data especificada
   	SELECT @producao_existente = quantidade
    FROM produzido
    WHERE id_produto = @id_produto AND @data = data

    -- Se existir, atualizar a quantidade
    IF @producao_existente > 0 
    	BEGIN
	        UPDATE produzido
	        SET quantidade = @producao_existente + @quantidade
	        WHERE id_produto = @id_produto AND @data = data
	    END
    ELSE
    	BEGIN 
        INSERT INTO produzido (id_produto, data, quantidade)
        VALUES (@id_produto, @data, @quantidade)
    	END
END
GO
