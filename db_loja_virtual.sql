-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/09/2021 às 17:39
-- Versão do servidor: 10.4.18-MariaDB
-- Versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_loja_virtual`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tb_clientes`
--

INSERT INTO `tb_clientes` (`id_cliente`, `nome`, `idade`) VALUES
(1, 'Jorge', 29),
(2, 'Maria', 23);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_descricoes_tecnicas`
--

CREATE TABLE `tb_descricoes_tecnicas` (
  `id_descricao_tecnica` int(11) NOT NULL,
  `fk_id_produto` int(11) NOT NULL,
  `descricao_tecnica` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tb_descricoes_tecnicas`
--

INSERT INTO `tb_descricoes_tecnicas` (`id_descricao_tecnica`, `fk_id_produto`, `descricao_tecnica`) VALUES
(1, 1, 'O novo Inspiron Dell oferece um design elegante e tela infinita que amplia seus sentidos, mantendo a sofisticação e medidas compactas...'),
(2, 2, 'A smart TV da Samsung possui tela de 40\" e oferece resolução Full HD, imagens duas vezes melhores que TVs HDs padrão...'),
(3, 3, 'Saia da mesmice. O smartphone LG está mais divertido, rápido, fácil, cheio de selfies e com tela HD de incríveis 5,3\"...');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_imagens`
--

CREATE TABLE `tb_imagens` (
  `id_imagem` int(11) NOT NULL,
  `fk_id_produto` int(11) NOT NULL,
  `url_imagem` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tb_imagens`
--

INSERT INTO `tb_imagens` (`id_imagem`, `fk_id_produto`, `url_imagem`) VALUES
(1, 1, 'notebook_1.jpg'),
(2, 1, 'notebook_2.jpg'),
(3, 1, 'notebook_3.jpg'),
(4, 2, 'smarttv_1.jpg'),
(5, 2, 'smarttv_2.jpg'),
(6, 3, 'smartphone_1.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pedidos`
--

CREATE TABLE `tb_pedidos` (
  `id_pedido` int(11) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tb_pedidos`
--

INSERT INTO `tb_pedidos` (`id_pedido`, `fk_id_cliente`, `data_hora`) VALUES
(1, 1, '2021-09-30 16:25:37'),
(2, 1, '2021-09-30 16:30:03'),
(3, 2, '2021-09-30 16:33:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pedidos_produtos`
--

CREATE TABLE `tb_pedidos_produtos` (
  `fk_id_pedido` int(11) NOT NULL,
  `fk_id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tb_pedidos_produtos`
--

INSERT INTO `tb_pedidos_produtos` (`fk_id_pedido`, `fk_id_produto`) VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `id_produto` int(11) NOT NULL,
  `produto` varchar(200) NOT NULL,
  `valor` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`id_produto`, `produto`, `valor`) VALUES
(1, 'Notebook Dell Inspiron Ultrafino Intel Core i7, 16GB RAM e 240GB SSD', 3500.00),
(2, 'Smart TV LED 40\" Samsung Full HD 2 HDMI 1 USB Wi-Fi Integrado', 1475.54),
(3, 'Smartphone LG K10 Dual Chip Android 7.0 4G Wi-Fi Câmera de 13MP', 629.99);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `tb_descricoes_tecnicas`
--
ALTER TABLE `tb_descricoes_tecnicas`
  ADD PRIMARY KEY (`id_descricao_tecnica`),
  ADD KEY `fk_id_produto` (`fk_id_produto`);

--
-- Índices de tabela `tb_imagens`
--
ALTER TABLE `tb_imagens`
  ADD PRIMARY KEY (`id_imagem`),
  ADD KEY `fk_id_produto` (`fk_id_produto`);

--
-- Índices de tabela `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_id_cliente` (`fk_id_cliente`);

--
-- Índices de tabela `tb_pedidos_produtos`
--
ALTER TABLE `tb_pedidos_produtos`
  ADD KEY `fk_id_pedido` (`fk_id_pedido`),
  ADD KEY `fk_id_produto` (`fk_id_produto`);

--
-- Índices de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_descricoes_tecnicas`
--
ALTER TABLE `tb_descricoes_tecnicas`
  MODIFY `id_descricao_tecnica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_imagens`
--
ALTER TABLE `tb_imagens`
  MODIFY `id_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_descricoes_tecnicas`
--
ALTER TABLE `tb_descricoes_tecnicas`
  ADD CONSTRAINT `tb_descricoes_tecnicas_ibfk_1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produtos` (`id_produto`);

--
-- Restrições para tabelas `tb_imagens`
--
ALTER TABLE `tb_imagens`
  ADD CONSTRAINT `tb_imagens_ibfk_1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produtos` (`id_produto`);

--
-- Restrições para tabelas `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD CONSTRAINT `tb_pedidos_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_clientes` (`id_cliente`);

--
-- Restrições para tabelas `tb_pedidos_produtos`
--
ALTER TABLE `tb_pedidos_produtos`
  ADD CONSTRAINT `tb_pedidos_produtos_ibfk_1` FOREIGN KEY (`fk_id_pedido`) REFERENCES `tb_pedidos` (`id_pedido`),
  ADD CONSTRAINT `tb_pedidos_produtos_ibfk_2` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produtos` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
