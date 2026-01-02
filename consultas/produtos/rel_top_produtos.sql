-- Relatório 12: Top produtos por receita e unidades vendidas (últimos 12 meses)
SELECT
  p.idProduto,
  p.descricao,
  SUM(iv.quantidade) AS unidades_vendidas,
  SUM(iv.quantidade * iv.preco_unit) AS receita
FROM itens_venda iv
JOIN vendas v ON v.idVenda = iv.idVenda
JOIN produtos p ON p.idProduto = iv.idProduto
WHERE v.data_venda BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND CURDATE()
GROUP BY p.idProduto, p.descricao
ORDER BY receita DESC
LIMIT 20;
