#!/bin/bash
# ==========================================================
# Script: setup_relatorios.sh
# Autor: Gabriel Cardoso Fernandes
# Descrição: Cria a estrutura de diretórios e arquivos SQL
#            para os relatórios do banco ERP Financeiro.
# Data: $(date +"%d/%m/%Y")
# ==========================================================

# Diretório base
BASE_DIR="consultas"

# Estrutura de subpastas
DIRS=(
  "$BASE_DIR/financeiro"
  "$BASE_DIR/vendas"
  "$BASE_DIR/estoque"
  "$BASE_DIR/produtos"
  "$BASE_DIR/dre"
)

# Arquivos correspondentes em cada módulo
declare -A FILES

# --- Financeiro ---
FILES["$BASE_DIR/financeiro"]="\
rel_titulos_resumo.sql
rel_titulos_vencidos.sql
rel_fluxo_caixa.sql
vw_resumo_financeiro_cliente.sql
sp_rel_titulos_por_periodo_regiao.sql"

# --- Vendas ---
FILES["$BASE_DIR/vendas"]="\
rel_faturamento_mensal.sql
rel_top_clientes.sql
rel_vendas_detalhado.sql"

# --- Estoque ---
FILES["$BASE_DIR/estoque"]="\
rel_produtos_margem_negativa.sql
rel_giro_estoque.sql
rel_movimentacoes_estoque.sql"

# --- Produtos ---
FILES["$BASE_DIR/produtos"]="\
rel_estoque_valorizado_por_cst.sql
rel_top_produtos.sql"

# --- DRE ---
FILES["$BASE_DIR/dre"]="\
rel_dre_mensal.sql"

# ==========================================================
# Criação dos diretórios
# ==========================================================
echo "📁 Criando estrutura de diretórios..."
for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
  echo " - Criado: $dir"
done

# ==========================================================
# Criação dos arquivos com cabeçalho padrão
# ==========================================================
echo ""
echo "🗂️  Criando arquivos SQL com cabeçalho padrão..."
for dir in "${!FILES[@]}"; do
  for file in ${FILES[$dir]}; do
    filepath="$dir/$file"
    if [ ! -f "$filepath" ]; then
      cat <<EOF > "$filepath"
-- ==========================================================
-- Arquivo: $file
-- Módulo: ${dir#$BASE_DIR/}
-- Projeto: ERP Financeiro
-- Autor: Gabriel Cardoso Fernandes
-- Data de criação: $(date +"%d/%m/%Y")
-- Descrição: [Adicione aqui a descrição do relatório]
-- ==========================================================

EOF
      echo " - Criado: $filepath"
    else
      echo " - Já existe: $filepath"
    fi
  done
done

echo ""
echo "✅ Estrutura completa criada com sucesso!"
echo "Caminho base: $(realpath "$BASE_DIR")"
