-- Relatório 4: Saldo contábil por conta (saldo atual + lançamentos)
SELECT
  cb.idConta,
  cb.banco,
  cb.conta,
  cb.saldo AS saldo_extrato,
  IFNULL(SUM(CASE WHEN lf.tipo_lancamento = 'receita' THEN lf.valor ELSE -lf.valor END), 0) AS movimentos_pendentes,
  (cb.saldo + IFNULL(SUM(CASE WHEN lf.tipo_lancamento = 'receita' THEN lf.valor ELSE -lf.valor END), 0)) AS saldo_theoretical
FROM contas_bancarias cb
LEFT JOIN lancamentos_financeiros lf ON lf.idConta = cb.idConta AND lf.data_lancamento > CURDATE()
GROUP BY cb.idConta, cb.banco, cb.conta, cb.saldo;
