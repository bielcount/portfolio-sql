-- Banco ERP Financeiro - Gabriel Cardoso Fernandes
-- Objetivo: Inserir dados simulados de forma massiva para testes e relatórios analíticos
USE erp_financeiro;

-- ==========================================
-- INSERÇÃO DE PESSOAS (CLIENTES E FORNECEDORES)
-- ==========================================
INSERT INTO pessoas (nome, tipo, regiao, email)
VALUES
('Comercial Silva LTDA', 'fornecedor', 'S', 'contato@comercialsilva.com'),
('Distribuidora Alves', 'fornecedor', 'N', 'financeiro@distribuidoraalves.com'),
('Mercado São João', 'cliente', 'S', 'compras@sãojoao.com'),
('Padaria Doce Pão', 'cliente', 'S', 'padaria@docepao.com'),
('Supermercado Bom Preço', 'cliente', 'N', 'contato@bompreco.com'),
('Oficina Mecânica TurboCar', 'cliente', 'N', 'adm@turbocar.com'),
('Tech Solutions LTDA', 'fornecedor', 'S', 'suporte@techsolutions.com'),
('Empório do Norte', 'cliente', 'N', 'empnorte@gmail.com'),
('Construtora Alfa', 'cliente', 'S', 'financeiro@construtoraalfa.com'),
('Fornecedor Central Ltda', 'fornecedor', 'S', 'central@fornecedorcentral.com');

-- ==========================================
-- INSERÇÃO DE PRODUTOS
-- ==========================================
INSERT INTO produtos (descricao, vlr_custo, vlr_venda, est_atual, cst)
VALUES
('Monitor 24" LED', 750.00, 950.00, 20, '060'),
('Teclado Mecânico RGB', 180.00, 280.00, 35, '060'),
('Mouse Gamer 7200dpi', 90.00, 160.00, 50, '060'),
('Notebook Dell Inspiron', 2800.00, 3500.00, 10, '010'),
('Impressora HP LaserJet', 1200.00, 1600.00, 15, '010'),
('Cabo HDMI 2m', 25.00, 55.00, 80, '060'),
('Pen Drive 64GB', 60.00, 110.00, 100, '060'),
('HD Externo 1TB', 260.00, 380.00, 25, '060'),
('Fonte ATX 500W', 220.00, 310.00, 30, '060'),
('Placa Mãe ASUS Prime', 680.00, 940.00, 12, '060');

-- ==========================================
-- INSERÇÃO DE COMPRAS
-- ==========================================
INSERT INTO compras (idFornecedor, data_compra, total)
VALUES
(1, '2025-01-10', 15000.00),
(2, '2025-02-05', 8000.00),
(7, '2025-03-15', 9500.00),
(10, '2025-04-01', 12000.00);

-- ==========================================
-- ITENS DE COMPRA (ENTRADAS DE ESTOQUE)
-- ==========================================
INSERT INTO itens_compra (idCompra, idProduto, quantidade, preco_unit)
VALUES
(1, 1, 10, 750.00),
(1, 2, 15, 180.00),
(1, 3, 20, 90.00),
(2, 4, 5, 2800.00),
(2, 5, 8, 1200.00),
(3, 6, 50, 25.00),
(3, 7, 40, 60.00),
(4, 8, 15, 260.00),
(4, 9, 10, 220.00),
(4, 10, 5, 680.00);

-- ==========================================
-- MOVIMENTOS DE ESTOQUE (ENTRADAS)
-- ==========================================
INSERT INTO estoque_movimentos (idProduto, tipo_movimento, quantidade, data_movimento)
SELECT idProduto, 'entrada', est_atual, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*180) DAY)
FROM produtos;

-- ==========================================
-- INSERÇÃO DE VENDAS
-- ==========================================
INSERT INTO vendas (idCliente, data_venda, total)
VALUES
(3, '2025-03-05', 1800.00),
(4, '2025-03-06', 4200.00),
(5, '2025-04-15', 3500.00),
(6, '2025-04-20', 2150.00),
(8, '2025-05-10', 4700.00),
(9, '2025-05-18', 2800.00);

-- ==========================================
-- ITENS DE VENDA (SAÍDAS DE ESTOQUE)
-- ==========================================
INSERT INTO itens_venda (idVenda, idProduto, quantidade, preco_unit)
VALUES
(1, 3, 5, 160.00),
(1, 2, 2, 280.00),
(2, 4, 1, 3500.00),
(2, 6, 5, 55.00),
(3, 5, 2, 1600.00),
(4, 7, 10, 110.00),
(4, 3, 2, 160.00),
(5, 8, 5, 380.00),
(5, 10, 2, 940.00),
(6, 1, 2, 950.00);

-- ==========================================
-- MOVIMENTOS DE ESTOQUE (SAÍDAS)
-- ==========================================
INSERT INTO estoque_movimentos (idProduto, tipo_movimento, quantidade, data_movimento)
SELECT idProduto, 'saida', quantidade, (SELECT data_venda FROM vendas WHERE idVenda = itens_venda.idVenda)
FROM itens_venda;

-- ==========================================
-- INSERÇÃO DE TÍTULOS (CONTAS A RECEBER E A PAGAR)
-- ==========================================
INSERT INTO titulos (idCliFor, tipoDoc, situacao, emissao, vencimento, valor, idSerie, idParcela)
VALUES
(3, 1, 'A', '2025-03-05', '2025-04-05', 1800.00, 'V001', 1),
(4, 1, 'B', '2025-03-06', '2025-04-06', 4200.00, 'V002', 1),
(5, 1, 'B', '2025-04-15', '2025-05-15', 3500.00, 'V003', 1),
(1, 2, 'A', '2025-03-10', '2025-03-30', 8000.00, 'C001', 1),
(2, 2, 'B', '2025-04-01', '2025-04-30', 9500.00, 'C002', 1),
(7, 2, 'A', '2025-04-10', '2025-05-20', 12000.00, 'C003', 1);

-- ==========================================
-- INSERÇÃO DE CONTAS BANCÁRIAS
-- ==========================================
INSERT INTO contas_bancarias (banco, agencia, conta, saldo)
VALUES
('Banco do Brasil', '1234', '0012345-6', 12000.00),
('Caixa Econômica', '1987', '0098765-4', 8500.00),
('Bradesco', '1001', '0001111-0', 15200.00);

-- ==========================================
-- INSERÇÃO DE LANÇAMENTOS FINANCEIROS (FLUXO DE CAIXA)
-- ==========================================
INSERT INTO lancamentos_financeiros (idConta, tipo_lancamento, valor, data_lancamento, descricao)
VALUES
(1, 'receita', 1800.00, '2025-03-05', 'Venda Mercado São João'),
(2, 'receita', 4200.00, '2025-03-06', 'Venda Padaria Doce Pão'),
(3, 'despesa', 8000.00, '2025-03-10', 'Compra de equipamentos'),
(1, 'receita', 3500.00, '2025-04-15', 'Venda Supermercado Bom Preço'),
(2, 'despesa', 9500.00, '2025-04-30', 'Pagamento a fornecedor Alves'),
(1, 'receita', 2150.00, '2025-04-20', 'Venda Oficina TurboCar'),
(3, 'receita', 4700.00, '2025-05-10', 'Venda Empório do Norte'),
(2, 'despesa', 12000.00, '2025-05-20', 'Compra Tech Solutions');

-- ==========================================
-- FIM DAS INSERÇÕES
-- ==========================================
-- Este dataset foi criado para gerar relatórios contábeis, fiscais e operacionais
-- como: DRE mensal, fluxo de caixa, margem de produtos, faturamento por cliente, etc.
