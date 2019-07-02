-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02-Jul-2019 às 22:35
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `deposito`
--

CREATE TABLE `deposito` (
  `numero` varchar(40) NOT NULL,
  `codigo_estoque` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `id` varchar(10) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `codigo_produto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente`
--

CREATE TABLE `gerente` (
  `codigo_func` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemfornecido`
--

CREATE TABLE `itemfornecido` (
  `id` varchar(20) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `lote` varchar(30) NOT NULL,
  `codigo_produto` varchar(30) NOT NULL,
  `codigo_fornecedor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itempedido`
--

CREATE TABLE `itempedido` (
  `codigo` varchar(100) NOT NULL,
  `preco_unitario` decimal(7,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `codigo_produto` varchar(30) NOT NULL,
  `codigo_venda` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notafiscal`
--

CREATE TABLE `notafiscal` (
  `id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `nome` varchar(100) NOT NULL,
  `data_validade` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `codigo` varchar(30) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatoriovenda`
--

CREATE TABLE `relatoriovenda` (
  `codigo_venda` varchar(30) NOT NULL,
  `codigo_relatorio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor`
--

CREATE TABLE `setor` (
  `codigo` varchar(30) NOT NULL,
  `codigo_funcionario` varchar(14) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `codigo` varchar(30) NOT NULL,
  `total_ganho` decimal(7,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigo_cliente` varchar(20) NOT NULL,
  `codigo_funcionario` varchar(20) NOT NULL,
  `codigo_produto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codigo_func` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Indexes for table `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigo_estoque` (`codigo_estoque`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_produto` (`codigo_produto`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`cnpj`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`cpf`);

--
-- Indexes for table `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`codigo_func`);

--
-- Indexes for table `itemfornecido`
--
ALTER TABLE `itemfornecido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_produto` (`codigo_produto`),
  ADD KEY `codigo_fornecedor` (`codigo_fornecedor`);

--
-- Indexes for table `itempedido`
--
ALTER TABLE `itempedido`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_produto` (`codigo_produto`),
  ADD KEY `codigo_venda` (`codigo_venda`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `relatoriovenda`
--
ALTER TABLE `relatoriovenda`
  ADD KEY `codigo_venda` (`codigo_venda`),
  ADD KEY `codigo_relatorio` (`codigo_relatorio`);

--
-- Indexes for table `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_funcionario` (`codigo_funcionario`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_cliente` (`codigo_cliente`),
  ADD KEY `codigo_funcionario` (`codigo_funcionario`),
  ADD KEY `codigo_produto` (`codigo_produto`);

--
-- Indexes for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codigo_func`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `deposito`
--
ALTER TABLE `deposito`
  ADD CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`codigo_estoque`) REFERENCES `estoque` (`id`);

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo`);

--
-- Limitadores para a tabela `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `gerente_ibfk_1` FOREIGN KEY (`codigo_func`) REFERENCES `funcionarios` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `itemfornecido`
--
ALTER TABLE `itemfornecido`
  ADD CONSTRAINT `itemfornecido_ibfk_1` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `itemfornecido_ibfk_2` FOREIGN KEY (`codigo_fornecedor`) REFERENCES `fornecedores` (`cnpj`);

--
-- Limitadores para a tabela `itempedido`
--
ALTER TABLE `itempedido`
  ADD CONSTRAINT `itempedido_ibfk_1` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `itempedido_ibfk_2` FOREIGN KEY (`codigo_venda`) REFERENCES `venda` (`codigo`);

--
-- Limitadores para a tabela `relatoriovenda`
--
ALTER TABLE `relatoriovenda`
  ADD CONSTRAINT `relatoriovenda_ibfk_1` FOREIGN KEY (`codigo_venda`) REFERENCES `venda` (`codigo`),
  ADD CONSTRAINT `relatoriovenda_ibfk_2` FOREIGN KEY (`codigo_relatorio`) REFERENCES `relatorio` (`codigo`);

--
-- Limitadores para a tabela `setor`
--
ALTER TABLE `setor`
  ADD CONSTRAINT `setor_ibfk_1` FOREIGN KEY (`codigo_funcionario`) REFERENCES `gerente` (`codigo_func`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`codigo_funcionario`) REFERENCES `vendedor` (`codigo_func`),
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo`);

--
-- Limitadores para a tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`codigo_func`) REFERENCES `funcionarios` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
