INSERT INTO [cliente] ([nome], [telefone], [cpf], [email])
VALUES 
('Maria Silva', '48999998888', '12345678901', 'maria.silva@gmail.com'),
('João Souza', '48888887777', '09876543210', 'joao.souza@hotmail.com'),
('Ana Pereira', '48777776666', '12312312312', 'ana.pereira@gmail.com'),
('Carlos Lima', '48666665555', '32132132132', 'carlos.lima@hotmail.com'),
('Fernanda Oliveira', '48555554444', '45645645645', 'fernanda.oliveira@gmail.com'),
('Pedro Almeida', '48444443333', '65465465465', 'pedro.almeida@hotmail.com'),
('Mariana Costa', '48333332222', '78978978978', 'mariana.costa@gmail.com'),
('Lucas Santos', '48222221111', '98798798798', 'lucas.santos@hotmail.com'),
('Juliana Rocha', '48111110000', '11122233344', 'juliana.rocha@gmail.com'),
('Gabriel Torres', '4800009999', '55566677788', 'gabriel.torres@hotmail.com'),
('Bruno Martins', '4887654321', '12309876543', 'bruno.martins@gmail.com'),
('Larissa Mendes', '4876543210', '32109876543', 'larissa.mendes@hotmail.com'),
('Rafael Dias', '4865432109', '45609876543', 'rafael.dias@gmail.com'),
('Camila Silva', '4854321098', '65409876543', 'camila.silva@hotmail.com'),
('Rodrigo Santos', '4843210987', '78909876543', 'rodrigo.santos@gmail.com'),
('Beatriz Almeida', '4832109876', '98709876543', 'beatriz.almeida@hotmail.com'),
('Marcelo Carvalho', '4821098765', '11133355577', 'marcelo.carvalho@gmail.com'),
('Renata Costa', '4810987654', '22244466688', 'renata.costa@hotmail.com');


INSERT INTO [produto] ([nome_produto], [preco])
VALUES 
('Bolo de Chocolate', 35.00),
('Torta de Morango', 25.50),
('Pão de Mel', 3.50),
('Brigadeiro', 2.00),
('Quindim', 4.00),
('Mousse de Maracujá', 5.00),
('Pudim de Leite', 6.00),
('Cupcake de Baunilha', 4.50),
('Churros', 3.00),
('Cookie de Chocolate', 2.50),
('Trufa de Chocolate', 1.50),
('Bombom de Amendoim', 1.00),
('Brownie', 3.00),
('Cheesecake', 5.50),
('Pastel de Belém', 4.50),
('Macaron', 2.00),
('Tiramisu', 6.00),
('Bolo de Cenoura', 4.00);



INSERT INTO [mesa] ([numero], [capacidade])
VALUES 
(1, 4),
(2, 2),
(3, 6),
(4, 4),
(5, 2),
(6, 8),
(7, 4),
(8, 2),
(9, 6),
(10, 4),
(11, 6),
(12, 2),
(13, 8),
(14, 4),
(15, 2),
(16, 6);



INSERT INTO [pedido] ([id_cliente], [id_mesa], [dt_pedido])
VALUES 
(1, 1, '2024-06-01'),
(2, 2, '2024-06-02'),
(3, 3, '2024-06-03'),
(4, 4, '2024-06-04'),
(5, 5, '2024-06-05'),
(6, 6, '2024-06-06'),
(7, 7, '2024-06-07'),
(8, 8, '2024-06-08'),
(9, 10, '2024-06-09'),
(10, 11, '2024-06-10'),
(11, 12, '2024-06-11'),
(12, 13, '2024-06-12'),
(13, 14, '2024-06-13'),
(14, 15, '2024-06-14');


INSERT INTO [pedido_item] ([id_produto], [id_pedido], [valor], [quantidade])
VALUES 
(1, 1, 35.00, 1),
(2, 2, 25.50, 2),
(3, 3, 4.00, 2),
(4, 4, 5.00, 1),
(5, 5, 6.00, 3),
(6, 6, 4.50, 4),
(7, 7, 3.00, 2),
(8, 8, 2.50, 5),
(9, 9, 1.50, 10),
(10, 10, 1.00, 15),
(11, 11, 3.00, 5),
(12, 12, 5.50, 4),
(13, 13, 4.50, 6),
(14, 14, 2.00, 20);

INSERT INTO [forma_de_pagamento] ([tp_pagamento])
VALUES 
('Cartão de Crédito'),
('Dinheiro'),
('Cartão de Débito'),
('Pix'),
('Vale Refeição'),
('Transferência Bancária'),
('Boleto'),
('Crédito Loja');


INSERT INTO [pagamento] ([id_pedido], [total], [id_forma_pagamento])
VALUES 
(1, 35.00, 1), 
(2, 51.00, 2), 
(3, 8.00, 3),  
(4, 5.00, 4),  
(5, 18.00, 5), 
(6, 18.00, 6), 
(7, 6.00, 7),  
(8, 12.50, 8), 
(9, 15.00, 1), 
(10, 15.00, 2),
(11, 15.00, 3),
(12, 22.00, 4),
(13, 27.00, 5),
(14, 40.00, 6);

INSERT INTO [produzido] ([id_produto], [data], [quantidade])
VALUES 
(1, '2024-06-01', 20), 
(2, '2024-06-02', 20), 
(3, '2024-06-03', 25), 
(4, '2024-06-04', 30), 
(5, '2024-06-05', 20), 
(6, '2024-06-06', 30), 
(7, '2024-06-07', 20), 
(8, '2024-06-08', 30), 
(9, '2024-06-09', 40), 
(10, '2024-06-10', 60),
(11, '2024-06-11', 50);

