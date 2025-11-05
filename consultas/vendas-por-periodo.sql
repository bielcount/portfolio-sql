-- Total de vendas agrupado por mês e ano
SELECT DATE_FORMAT(data_venda, '%Y-%m') AS mes,
       SUM(total) AS total_vendido
FROM vendas
GROUP BY mes
ORDER BY mes;
