-- Relatório 3: Fluxo de caixa diário por conta (entradas e saídas)
SELECT
  cb.idConta,
  cb.banco,
  cb.conta,
  lf.data_lancamento AS data,
  SUM(CASE WHEN lf.tipo_lancamento = 'receita' THEN lf.valor ELSE 0 END) AS total_receita,
  SUM(CASE WHEN lf.tipo_lancamento = 'despesa' THEN lf.valor ELSE 0 END) AS total_despesa,
  (SUM(CASE WHEN lf.tipo_lancamento = 'receita' THEN lf.valor ELSE 0 END)
   - SUM(CASE WHEN lf.tipo_lancamento = 'despesa' THEN lf.valor ELSE 0 END)) AS saldo_diario
FROM lancamentos_financeiros lf
JOIN contas_bancarias cb ON cb.idConta = lf.idConta
WHERE lf.data_lancamento BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
GROUP BY cb.idConta, lf.data_lancamento
ORDER BY cb.idConta, lf.data_lancamento;
