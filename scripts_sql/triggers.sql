-- TRIGGER: Atualizar Total de Pagamento
CREATE OR ALTER TRIGGER atualizar_total_pagamento ON pedido_item
AFTER INSERT AS
BEGIN
	IF (ROWCOUNT_BIG() = 0)
 	RETURN;
    DECLARE 
    @count_pedido INT,
    @total_atualizado DECIMAL(10,2),
    @id_pedido INT,
	@valor DECIMAL(10,2),
	@quantidade INT
    
    SELECT 
    @id_pedido = id_pedido, @valor = valor, @quantidade = quantidade 
    FROM inserted

    -- Calcular o total do novo pedido
    SELECT @total_atualizado = @valor * @quantidade
		
    -- Verificar se o pagamento já existe para o pedido
    SELECT @count_pedido = COUNT(id_pedido)
    FROM pagamento
    WHERE id_pedido = @id_pedido;

    -- Se o pagamento existir, atualizar o total
    IF @count_pedido > 0
    	BEGIN
        UPDATE pagamento
        SET total = @total_atualizado + total
        WHERE id_pedido = @id_pedido;
       	END 
    -- Se não existir, inserir um novo registro de pagamento
    ELSE
    	BEGIN 
        INSERT INTO pagamento (id_pedido, total, status_pagamento)
        VALUES (@id_pedido, @total_atualizado, 0);
       	END 
END
GO
