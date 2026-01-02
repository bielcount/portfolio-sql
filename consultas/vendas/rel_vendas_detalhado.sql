-- ==========================================================
-- Arquivo: rel_vendas_detalhado.sql
-- Módulo: vendas
-- Projeto: ERP Financeiro
-- Autor: Gabriel Cardoso Fernandes
-- Data de criação: 05/11/2025
-- Descrição: [Adicione aqui a descrição do relatório]
-- ==========================================================

-- Relatório 7: Clientes com títulos em aberto + última compra (prioridade cobrança)
SELECT
  p.idPessoa,
  p.nome,
  MAX(v.data_venda) AS ultima_compra,
  SUM(CASE WHEN t.situacao = 'A' THEN t.valor ELSE 0 END) AS total_em_aberto,
  COUNT(CASE WHEN t.situacao = 'A' THEN 1 END) AS qtde_titulos_aberto
FROM pessoas p
LEFT JOIN vendas v ON v.idCliente = p.idPessoa
LEFT JOIN titulos t ON t.idCliFor = p.idPessoa
GROUP BY p.idPessoa, p.nome
HAVING total_em_aberto > 0
ORDER BY total_em_aberto DESC, ultima_compra DESC;
