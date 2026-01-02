-- Criação de view para resumo financeiro por cliente
CREATE OR REPLACE VIEW vw_resumo_financeiro_cliente AS
SELECT
  p.idPessoa,
  p.nome,
  COALESCE(SUM(CASE WHEN t.situacao = 'A' THEN t.valor ELSE 0 END),0) AS total_aberto,
  COALESCE(SUM(CASE WHEN t.situacao = 'F' THEN t.valor ELSE 0 END),0) AS total_pago,
  COALESCE(SUM(v.total),0) AS total_vendas
FROM pessoas p
LEFT JOIN titulos t ON t.idCliFor = p.idPessoa
LEFT JOIN vendas v ON v.idCliente = p.idPessoa
GROUP BY p.idPessoa, p.nome;
