-- Relatório 2: Aging - total e quantidade de títulos vencidos por cliente
SELECT
  p.idPessoa,
  p.nome,
  COUNT(t.idTitulo) AS qtd_titulos_vencidos,
  SUM(t.valor) AS total_vencido
FROM titulos t
JOIN pessoas p ON p.idPessoa = t.idCliFor
WHERE t.vencimento < CURDATE() AND t.situacao = 'A'  -- apenas em aberto e atrasados
GROUP BY p.idPessoa, p.nome
HAVING SUM(t.valor) > 0
ORDER BY total_vencido DESC;
