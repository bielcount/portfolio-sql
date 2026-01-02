-- ==========================================================
-- Arquivo: rel_faturamento_mensal.sql
-- Módulo: vendas
-- Projeto: ERP Financeiro
-- Autor: Gabriel Cardoso Fernandes
-- Data de criação: 05/11/2025
-- Descrição: [Adicione aqui a descrição do relatório]
-- ==========================================================

-- Relatório 5: Faturamento mensal consolidado (vendas + titulos fechados)
WITH fatur_vendas AS (
  SELECT DATE_FORMAT(data_venda, '%Y-%m') AS mes, SUM(total) AS valor
  FROM vendas
  WHERE data_venda IS NOT NULL
  GROUP BY mes
),
fatur_titulos AS (
  SELECT DATE_FORMAT(emissao, '%Y-%m') AS mes, SUM(valor) AS valor
  FROM titulos
  WHERE situacao = 'F'  -- títulos fechados
  GROUP BY mes
)
SELECT
  COALESCE(fv.mes, ft.mes) AS mes,
  COALESCE(fv.valor,0) AS vendas_valor,
  COALESCE(ft.valor,0) AS titulos_valor,
  COALESCE(fv.valor,0) + COALESCE(ft.valor,0) AS faturamento_total
FROM fatur_vendas fv
FULL OUTER JOIN fatur_titulos ft ON fv.mes = ft.mes
ORDER BY mes;
