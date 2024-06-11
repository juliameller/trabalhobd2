CREATE TABLE [cliente] (
  [id_cliente] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nome] varchar(50) NOT NULL,
  [telefone] varchar(11),
  [cpf] char(11) NOT NULL,
  [email] varchar(30)
)
GO

CREATE TABLE [produto] (
  [id_produto] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nome_produto] varchar(50),
  [preco] numeric(10,2)
)
GO

CREATE TABLE [mesa] (
  [id_mesa] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [numero] int,
  [capacidade] int
)
GO

CREATE TABLE [pedido] (
  [id_pedido] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_cliente] integer,
  [id_mesa] integer,
  [dt_pedido] datetime NOT NULL
)
GO

CREATE TABLE [pedido_item] (
  [id_pedido_item] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_produto] integer,
  [id_pedido] integer,
  [valor] numeric(10,2) NOT NULL,
  [quantidade] int NOT NULL
)
GO

CREATE TABLE [pagamento] (
  [id_pagamento] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_pedido] integer,
  [total] numeric(13,2) NOT NULL,
  [id_forma_pagamento] integer,
  [status_pagamento] bit NOT NULL -- pago = 1 ou em aberto = 0
)
GO

CREATE TABLE [forma_de_pagamento] (
  [id_forma_pagamento] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [tp_pagamento] varchar(30) NOT NULL
)
GO

CREATE TABLE [produzido] (
  [id_produzido] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_produto] integer,
  [data] datetime NOT NULL,
  [quantidade] int NOT NULL
)
GO

ALTER TABLE [pedido] ADD FOREIGN KEY ([id_cliente]) REFERENCES [cliente] ([id_cliente])
GO

ALTER TABLE [pedido] ADD FOREIGN KEY ([id_mesa]) REFERENCES [mesa] ([id_mesa])
GO

ALTER TABLE [pedido_item] ADD FOREIGN KEY ([id_produto]) REFERENCES [produto] ([id_produto])
GO

ALTER TABLE [pedido_item] ADD FOREIGN KEY ([id_pedido]) REFERENCES [pedido] ([id_pedido])
GO

ALTER TABLE [pagamento] ADD FOREIGN KEY ([id_pedido]) REFERENCES [pedido] ([id_pedido])
GO

ALTER TABLE [pagamento] ADD FOREIGN KEY ([id_forma_pagamento]) REFERENCES [forma_de_pagamento] ([id_forma_pagamento])
GO

ALTER TABLE [produzido] ADD FOREIGN KEY ([id_produto]) REFERENCES [produto] ([id_produto])
GO
