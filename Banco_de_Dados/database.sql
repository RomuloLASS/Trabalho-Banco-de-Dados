CREATE TABLE bd.funcionarios (
    nome varchar(100) NOT NULL,
    cpf varchar(14) NOT NULL,
    telefone varchar(20) NOT NULL,
    endereco varchar(50) NOT NULL,
    tipo int NOT NULL
);

CREATE TABLE bd.gerente(
    codigo_func varchar(14) NOT NULL
);

CREATE TABLE bd.vendedor(
    codigo_func varchar(14) NOT NULL
);

CREATE TABLE bd.cliente (
    nome varchar(100) NOT NULL,
    cpf varchar(14) NOT NULL,
    telefone varchar(20) NOT NULL,
    endereco varchar(50) NOT NULL
);

CREATE TABLE bd.fornecedores (
    nome varchar(100) NOT NULL,
    cnpj varchar(30) NOT NULL,
    telefone varchar(20) NOT NULL,
    endereco varchar(50) NOT NULL
);

CREATE TABLE bd.setor (
    codigo varchar(30) NOT NULL,
    codigo_funcionario varchar(14) NOT NULL,
    tipo varchar(30) NOT NULL
);

CREATE TABLE bd.produto(
    nome varchar(100) NOT NULL,
    data_validade timestamp NOT NULL,
    codigo varchar(30) NOT NULL
);

CREATE TABLE bd.venda (
    codigo varchar(30) NOT NULL,
    total_ganho numeric(7,2) NOT NULL,
    data timestamp NOT NULL,
    codigo_cliente varchar(20) NOT NULL,
    codigo_funcionario varchar(20) NOT NULL
);

CREATE TABLE bd.itempedido(
    codigo varchar(100) NOT NULL,
    preco_unitario numeric(7,2) NOT NULL,
    quantidade integer NOT NULL,
    codigo_produto varchar(30) NOT NULL,
    codigo_venda varchar(30) NOT NULL
);

CREATE TABLE bd.itemfornecido(
    id VARCHAR(20) NOT NULL,
    preco numeric(10,2) NOT NULL,
    quantidade integer NOT NULL,
    lote varchar(30) NOT NULL,
    codigo_produto varchar(30) NOT NULL,
    codigo_fornecedor varchar(20) NOT NULL
);

CREATE TABLE bd.estoque(
    id varchar(10) NOT NULL,
    quantidade integer NOT NULL DEFAULT '0',
    codigo_produto varchar(30) NOT NULL
);

CREATE TABLE bd.deposito(
    numero varchar(40) NOT NULL,
    codigo_estoque varchar(40) NOT NULL
);

CREATE TABLE bd.relatorio(
    codigo varchar(30) NOT NULL,
    data timestamp NOT NULL
);

CREATE TABLE bd.relatoriovenda(
    codigo_venda varchar(30) NOT NULL,
    codigo_relatorio varchar(30) NOT NULL
);

CREATE TABLE bd.notafiscal(
    id varchar (30) NOT NULL,
    codigo_venda varchar(30) NOT NULL
);

-- -----------------------------------------------------------------------------------

ALTER TABLE bd.funcionarios
  ADD PRIMARY KEY (cpf);

ALTER TABLE bd.gerente
  ADD PRIMARY KEY (codigo_func),
  ADD FOREIGN KEY (codigo_func) REFERENCES bd.funcionarios (cpf) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE bd.vendedor
  ADD PRIMARY KEY (codigo_func),
  ADD FOREIGN KEY (codigo_func) REFERENCES bd.funcionarios (cpf) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE bd.cliente
  ADD PRIMARY KEY (cpf);

ALTER TABLE bd.fornecedores
  ADD PRIMARY KEY (cnpj);

ALTER TABLE bd.setor
  ADD PRIMARY KEY (codigo),
  ADD FOREIGN KEY (codigo_funcionario) REFERENCES bd.gerente (codigo_func);

ALTER TABLE bd.produto
  ADD PRIMARY KEY (codigo);

ALTER TABLE bd.venda
  ADD PRIMARY KEY (codigo),
  ADD  FOREIGN KEY (codigo_cliente) REFERENCES bd.cliente (cpf),
  ADD  FOREIGN KEY (codigo_funcionario) REFERENCES bd.vendedor (codigo_func);


ALTER TABLE bd.itempedido
  ADD PRIMARY KEY (codigo),
  ADD FOREIGN KEY (codigo_produto) REFERENCES bd.produto (codigo),
  ADD FOREIGN KEY (codigo_venda) REFERENCES bd.venda (codigo);

ALTER TABLE bd.itemfornecido
  ADD PRIMARY KEY (id),
  ADD FOREIGN KEY (codigo_produto) REFERENCES bd.produto (codigo),
  ADD FOREIGN KEY (codigo_fornecedor) REFERENCES bd.fornecedores (cnpj);

ALTER TABLE bd.estoque
  ADD PRIMARY KEY (id),
  ADD FOREIGN KEY (codigo_produto) REFERENCES bd.produto (codigo);

ALTER TABLE bd.deposito
  ADD PRIMARY KEY (numero),
  ADD FOREIGN KEY (codigo_estoque) REFERENCES bd.estoque (id);

ALTER TABLE bd.relatorio
  ADD PRIMARY KEY (codigo);

ALTER TABLE bd.relatoriovenda
  ADD FOREIGN KEY (codigo_venda) REFERENCES bd.venda (codigo),
  ADD FOREIGN KEY (codigo_relatorio) REFERENCES bd.relatorio (codigo);

ALTER TABLE bd.notafiscal
  ADD FOREIGN KEY (codigo_venda) REFERENCES bd.venda(codigo)
