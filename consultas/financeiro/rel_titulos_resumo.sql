-- Relatório 1: Resumo de títulos com status legível
-- Uso: visão rápida do estado dos títulos (A=Aberta, F=Fechada, C=Cancelada)
SELECT
  t.idTitulo,
  t.idCliFor,
  p.nome AS nome_pessoa,
  t.idSerie,
  t.idParcela,
  CASE t.situacao
    WHEN 'A' THEN 'ABERTA'
    WHEN 'F' THEN 'FECHADA'
    WHEN 'C' THEN 'CANCELADA'
    ELSE 'DESCONHECIDO'
  END AS situacao_texto,
  t.emissao,
  t.vencimento,
  t.valor,
  CURRENT_TIMESTAMP() AS gerado_em
FROM titulos t
LEFT JOIN pessoas p ON p.idPessoa = t.idCliFor
ORDER BY t.vencimento, p.nome;
