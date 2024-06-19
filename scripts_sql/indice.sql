-- Índices para a função de ticket médio
CREATE INDEX idx_pedido_item_id_pedido2 ON pedido_item(id_pedido) INCLUDE(valor, quantidade);

-- Índices para a consulta de sobra na produção
CREATE INDEX idx_produzido_data ON produzido(data);

-- Índices adicionais para a função calcular_ticket_medio
CREATE INDEX idx_pagamento_id_pedido_status_pagamento ON pagamento(id_pedido, status_pagamento) INCLUDE(total);
