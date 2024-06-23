-- Remoção de Índices Existentes:

DROP INDEX IF EXISTS idx_pagamento_id_pedido_status_pagamento ON pagamento 
DROP INDEX IF EXISTS idx_pedido_id_pedido_dt_pedido ON pedido;

-- Criação de Índices:

CREATE INDEX idx_pagamento_id_pedido_status_pagamento ON pagamento(id_pedido, status_pagamento) INCLUDE(total);
CREATE INDEX idx_pedido_id_pedido_dt_pedido ON pedido(dt_pedido, id_pedido);

-- Remoção de Índices Existentes:

DROP INDEX IF EXISTS idx_pedido_item_id_pedido_id_produto ON pedido_item;
DROP INDEX IF EXISTS idx_produto ON produto;
DROP INDEX IF EXISTS idx_produzido_data ON produzido;

-- Criação de Novos Índices:

CREATE INDEX idx_pedido_item_id_pedido_id_produto ON pedido_item (id_pedido, id_produto) INCLUDE (quantidade);
CREATE INDEX idx_produzido_data ON produzido (id_produto, data) INCLUDE (quantidade);
CREATE INDEX idx_produto ON produto (id_produto) INCLUDE (nome_produto);

