-- Relatório 8: Produtos com margem negativa e estoque disponível
SELECT
  idProduto,
  descricao,
  vlr_custo,
  vlr_venda,
  est_atual,
  (vlr_venda - vlr_custo) AS margem_unitaria
FROM produtos
WHERE vlr_venda < vlr_custo AND est_atual > 0
ORDER BY margem_unitaria ASC;
