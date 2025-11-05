-- Produtos que nunca foram vendidos
SELECT p.descricao
FROM produtos p
LEFT JOIN itens_venda i ON p.id = i.id_produto
WHERE i.id_produto IS NULL;
