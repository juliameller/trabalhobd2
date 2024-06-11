-- FUNCTION: Calcular Ticket Médio
CREATE OR ALTER FUNCTION calcular_ticket_medio(@data_inicio DATE, @data_fim DATE) RETURNS DECIMAL(10,2) AS 
BEGIN
	DECLARE @ticket_medio DECIMAL(10,2);   
	SELECT @ticket_medio = AVG(total) 
	FROM pedido p 
	JOIN pagamento pm ON p.id_pedido = pm.id_pedido
	WHERE p.dt_pedido BETWEEN @data_inicio AND @data_fim AND pm.status_pagamento = 1; -- Considera apenas os pedidos pagos   
RETURN @ticket_medio
END
GO