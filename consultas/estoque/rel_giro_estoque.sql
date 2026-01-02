-- Relatório 9: Giro de estoque (qtde vendida / estoque atual) últimos 6 meses
SELECT
  p.idProduto,
  p.descricao,
  IFNULL(SUM(iv.quantidade),0) AS qtd_vendida_6m,
  p.est_atual,
  CASE WHEN p.est_atual = 0 THEN NULL ELSE ROUND(IFNULL(SUM(iv.quantidade),0) / p.est_atual, 4) END AS giro
FROM produtos p
LEFT JOIN itens_venda iv ON iv.idProduto = p.idProduto
LEFT JOIN vendas v ON v.idVenda = iv.idVenda AND v.data_venda BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND CURDATE()
GROUP BY p.idProduto, p.descricao, p.est_atual
ORDER BY giro DESC;

