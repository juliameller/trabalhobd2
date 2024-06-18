-- Criação do índice na tabela pedido_item
CREATE INDEX idx_pedido_item_id_pedido ON pedido_item(id_pedido)

CREATE INDEX idx_pedido_item_id_pedido2 ON pedido_item(id_pedido) INCLUDE(valor, quantidade);

-- Criação do índice na tabela pagamento
CREATE INDEX idx_pagamento_id_pedido ON pagamento(id_pedido);

CREATE INDEX idx_pagamento_id_pedido_status_pagamento ON pagamento(id_pedido, status_pagamento) INCLUDE (total);
