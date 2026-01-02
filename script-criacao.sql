-- Banco ERP Financeiro 
CREATE DATABASE IF NOT EXISTS testeDB;
USE testeDB;

CREATE TABLE pessoas (
  idPessoa INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  tipo ENUM('cliente','fornecedor') NOT NULL,
  regiao CHAR(2),
  email VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
  idProduto INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(120) NOT NULL,
  vlr_custo DECIMAL(10,2) NOT NULL,
  vlr_venda DECIMAL(10,2) NOT NULL,
  est_atual INT NOT NULL DEFAULT 0,
  cst VARCHAR(3),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE titulos (
  idTitulo INT AUTO_INCREMENT PRIMARY KEY,
  idCliFor INT NOT NULL,
  tipoDoc INT NOT NULL,
  situacao CHAR(1) DEFAULT 'A',
  emissao DATE NOT NULL,
  vencimento DATE NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  idSerie VARCHAR(10),
  idParcela INT,
  FOREIGN KEY (idCliFor) REFERENCES pessoas(idPessoa)
);

CREATE TABLE vendas (
  idVenda INT AUTO_INCREMENT PRIMARY KEY,
  idCliente INT,
  data_venda DATE,
  total DECIMAL(10,2),
  FOREIGN KEY (idCliente) REFERENCES pessoas(idPessoa)
);

CREATE TABLE itens_venda (
  idItem INT AUTO_INCREMENT PRIMARY KEY,
  idVenda INT,
  idProduto INT,
  quantidade INT,
  preco_unit DECIMAL(10,2),
  FOREIGN KEY (idVenda) REFERENCES vendas(idVenda),
  FOREIGN KEY (idProduto) REFERENCES produtos(idProduto)
);
CREATE TABLE compras (
  idCompra INT AUTO_INCREMENT PRIMARY KEY,
  idFornecedor INT,
  data_compra DATE,
  total DECIMAL(10,2),
  FOREIGN KEY (idFornecedor) REFERENCES pessoas(idPessoa)
);

CREATE TABLE itens_compra (
  idItem INT AUTO_INCREMENT PRIMARY KEY,
  idCompra INT,
  idProduto INT,
  quantidade INT,
  preco_unit DECIMAL(10,2),
  FOREIGN KEY (idCompra) REFERENCES compras(idCompra),  
  FOREIGN KEY (idProduto) REFERENCES produtos(idProduto)
);
CREATE TABLE estoque_movimentos (
  idMovimento INT AUTO_INCREMENT PRIMARY KEY,
  idProduto INT,
  tipo_movimento ENUM('entrada','saida'),
  quantidade INT,
  data_movimento DATE,
  FOREIGN KEY (idProduto) REFERENCES produtos(idProduto)
  
); CREATE TABLE contas_bancarias (
  idConta INT AUTO_INCREMENT PRIMARY KEY,
  banco VARCHAR(50),
  agencia VARCHAR(10),
  conta VARCHAR(20),
  saldo DECIMAL(10,2) DEFAULT 0.00,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lancamentos_financeiros (
  idLancamento INT AUTO_INCREMENT PRIMARY KEY,
  idConta INT,
  tipo_lancamento ENUM('receita','despesa'),  valor DECIMAL(10,2),
  data_lancamento DATE,
  descricao VARCHAR(255),
  FOREIGN KEY (idConta) REFERENCES contas_bancarias(idConta)
);

CREATE TABLE forma_pagamento (
idForma_pagamento INT AUTOINCREMENT PRIMARY KEY,

);

CREATE INDEX idx_pessoas_tipo ON pessoas(tipo);
CREATE INDEX idx_produtos_cst ON produtos(cst);
CREATE INDEX idx_titulos_situacao ON titulos(situacao);
CREATE INDEX idx_titulos_vencimento ON titulos(vencimento);
CREATE INDEX idx_estoque_data ON estoque_movimentos(data_movimento);CREATE INDEX idx_lancamentos_data ON lancamentos_financeiros(data_lancamento);
CREATE INDEX idx_vendas_data ON vendas(data_venda);
CREATE INDEX idx_itens_venda_idProduto ON itens_venda(idProduto);
CREATE INDEX idx_compras_data ON compras(data_compra);
CREATE INDEX idx_itens_compra_idProduto ON itens_compra(idProduto); 

