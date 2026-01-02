-- ==========================================================
-- Arquivo: rel_top_clientes.sql
-- Módulo: vendas
-- Projeto: ERP Financeiro
-- Autor: Gabriel Cardoso Fernandes
-- Data de criação: 05/11/2025
-- Descrição: [Adicione aqui a descrição do relatório]
-- ==========================================================

-- Relatório 6: Top clientes últimos 12 meses (por vendas)
SELECT
  p.idPessoa,
  p.nome,
  SUM(v.total) AS total_compras,
  COUNT(v.idVenda) AS numero_pedidos,
  AVG(v.total) AS ticket_medio
FROM vendas v
JOIN pessoas p ON p.idPessoa = v.idCliente
WHERE v.data_venda BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND CURDATE()
GROUP BY p.idPessoa, p.nome
ORDER BY total_compras DESC
LIMIT 10;
