-- Faturamento total por mês
SELECT DATE_FORMAT(data_venda, '%Y-%m') AS mes,
       SUM(total) AS faturamento
FROM vendas
GROUP BY mes
ORDER BY mes;
