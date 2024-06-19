-- Índices para a função de ticket médio
CREATE INDEX idx_pedido_item_id_pedido2 ON pedido_item(id_pedido) INCLUDE(valor, quantidade);

-- Índices para a consulta de sobra na produção
CREATE INDEX idx_pedido_item_id_produto ON pedido_item (id_produto);
CREATE INDEX idx_produto_id_produto ON produto (id_produto);
CREATE INDEX idx_produzido_data ON produzido (data);
CREATE INDEX idx_produzido_id_produto ON produzido (id_produto);

-- Índices para a consulta do produto mais e menos consumido
CREATE INDEX idx_pedido_item_id_produto ON pedido_item (id_produto);
CREATE INDEX idx_produto_id_produto ON produto (id_produto);

-- Índices para a consulta da forma de pagamento mais utilizada
CREATE INDEX idx_pagamento_id_forma_pagamento ON pagamento (id_forma_pagamento);
CREATE INDEX idx_forma_de_pagamento_id_forma_pagamento ON forma_de_pagamento (id_forma_pagamento);

-- Índices para a consulta da média de produtos vendidos
CREATE INDEX idx_pedido_item_id_produto ON pedido_item (id_produto);
CREATE INDEX idx_produto_id_produto ON produto (id_produto);

-- Índices adicionais para a função calcular_ticket_medio
CREATE INDEX idx_pagamento_id_pedido ON pagamento (id_pedido);
CREATE INDEX idx_pagamento_id_pedido_status_pagamento ON pagamento (id_pedido, status_pagamento) INCLUDE (total);
