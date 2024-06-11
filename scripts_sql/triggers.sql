-- TRIGGER: Atualizar Total de Pagamento
CREATE OR ALTER TRIGGER atualizar_total_pagamento ON pedido_item
AFTER INSERT AS
BEGIN
	IF (ROWCOUNT_BIG() = 0)
 	RETURN;
    DECLARE 
    @count_pedido INT,
    @total_atualizado DECIMAL(10,2),
    
    SELECT 
    @id_pedido = id_pedido 
    FROM inserted

    -- Calcular o novo total do pedido
    SELECT @total_atualizado = (SELECT SUM(valor * quantidade) FROM pedido_item WHERE id_pedido = @id_pedido);

    -- Verificar se o pagamento já existe para o pedido
    SELECT @count_pedido = COUNT(id_pedido)
    FROM pagamento
    WHERE id_pedido = @id_pedido;

    -- Se o pagamento existir, atualizar o total
    IF @count_pedido > 0
    	BEGIN
        UPDATE pagamento
        SET total = @total_atualizado
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
