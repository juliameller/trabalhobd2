-- Criação do índice na tabela pedido_item
CREATE INDEX idx_pedido_item_id_pedido ON pedido_item(id_pedido);

-- Criação do índice na tabela pagamento
CREATE INDEX idx_pagamento_id_pedido ON pagamento(id_pedido);
