-- Clientes que mais compraram
SELECT c.nome, SUM(v.total) AS total_compras
FROM clientes c
JOIN vendas v ON c.id = v.id_cliente
GROUP BY c.nome
ORDER BY total_compras DESC
LIMIT 5;
