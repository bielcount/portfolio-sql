-- Produtos com estoque abaixo de 10 unidades
SELECT descricao, estoque
FROM produtos
WHERE estoque < 10
ORDER BY estoque ASC;
