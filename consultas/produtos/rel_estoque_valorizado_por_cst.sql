-- Relatório 11: Valorização do estoque por CST
SELECT
  p.cst,
  COUNT(p.idProduto) AS qtde_produtos,
  SUM(p.est_atual * p.vlr_custo) AS custo_total_estoque,
  SUM(p.est_atual * p.vlr_venda) AS valor_venda_total
FROM produtos p
GROUP BY p.cst
ORDER BY custo_total_estoque DESC;
