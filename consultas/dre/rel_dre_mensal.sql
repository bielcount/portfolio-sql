-- Relatório 13: DRE simplificado por mês (receita, custo vendido, margem)
WITH detalhe_vendas AS (
  SELECT DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
         iv.idProduto,
         SUM(iv.quantidade * iv.preco_unit) AS receita,
         SUM(iv.quantidade * p.vlr_custo) AS custo_vendido
  FROM itens_venda iv
  JOIN vendas v ON v.idVenda = iv.idVenda
  JOIN produtos p ON p.idProduto = iv.idProduto
  WHERE v.data_venda BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND CURDATE()
  GROUP BY mes, iv.idProduto
)
SELECT
  mes,
  SUM(receita) AS total_receita,
  SUM(custo_vendido) AS total_custo_vendido,
  (SUM(receita) - SUM(custo_vendido)) AS margem_bruta,
  ROUND((SUM(receita) - SUM(custo_vendido)) / NULLIF(SUM(receita),0) * 100,2) AS margem_percentual
FROM detalhe_vendas
GROUP BY mes
ORDER BY mes;
