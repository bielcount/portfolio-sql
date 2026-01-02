-- Relatório 10: Movimentações de estoque por produto no mês atual
SELECT
  em.idProduto,
  p.descricao,
  em.tipo_movimento,
  SUM(em.quantidade) AS total_qtde,
  DATE_FORMAT(em.data_movimento, '%Y-%m') AS mes
FROM estoque_movimentos em
JOIN produtos p ON p.idProduto = em.idProduto
WHERE em.data_movimento BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND LAST_DAY(CURDATE())
GROUP BY em.idProduto, em.tipo_movimento, DATE_FORMAT(em.data_movimento, '%Y-%m')
ORDER BY p.descricao, em.tipo_movimento;
