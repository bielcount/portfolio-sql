USE erp_portfolio;

-- Clientes
INSERT INTO clientes (nome, cidade, estado, data_cadastro) VALUES
('Ana Souza', 'Uruguaiana', 'RS', '2024-05-10'),
('Carlos Lima', 'Porto Alegre', 'RS', '2024-06-15'),
('Fernanda Alves', 'Pelotas', 'RS', '2024-07-20'),
('Ricardo Dias', 'Santa Maria', 'RS', '2024-08-01'),
('Juliana Rocha', 'Bagé', 'RS', '2024-09-05');

-- Produtos
INSERT INTO produtos (descricao, preco, estoque) VALUES
('Mouse Óptico', 45.90, 50),
('Teclado Mecânico', 320.00, 15),
('Monitor 24"', 950.00, 8),
('Headset Gamer', 210.00, 5),
('Cadeira Ergonômica', 1150.00, 2);

-- Vendas
INSERT INTO vendas (id_cliente, data_venda, total) VALUES
(1, '2024-09-01', 365.90),
(2, '2024-09-10', 1360.00),
(3, '2024-10-05', 950.00),
(4, '2024-10-12', 210.00),
(5, '2024-10-25', 1150.00);

-- Itens da venda
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 45.90),
(1, 2, 1, 320.00),
(2, 3, 1, 950.00),
(2, 2, 1, 320.00),
(3, 3, 1, 950.00),
(4, 4, 1, 210.00),
(5, 5, 1, 1150.00);
