-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/09/2026 às 15:29
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `portal_estudos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `cgm` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `turma` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `cgm`, `nome`, `turma`) VALUES
(1, '20260001', 'João Silva', '2A'),
(2, '20260002', 'Maria Souza', '2B'),
(3, '20260003', 'Pedro Santos', '3A'),
(4, '20260004', 'Ana Oliveira', '1A'),
(5, '20260005', 'Lucas Pereira', '2A'),
(6, '20260006', 'Beatriz Costa', '3B'),
(7, '20260007', 'Gabriel Almeida', '1B'),
(8, '20260008', 'Julia Rodrigues', '2B');

-- --------------------------------------------------------

--
-- Estrutura para tabela `duvidas`
--

CREATE TABLE `duvidas` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `disciplina` varchar(100) NOT NULL,
  `tema` varchar(150) NOT NULL,
  `pergunta` text NOT NULL,
  `resposta` text DEFAULT NULL,
  `link_youtube` varchar(500) DEFAULT NULL,
  `status` enum('Pendente','Respondida') DEFAULT 'Pendente',
  `data_envio` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `duvidas`
--

INSERT INTO `duvidas` (`id`, `aluno_id`, `disciplina`, `tema`, `pergunta`, `resposta`, `link_youtube`, `status`, `data_envio`) VALUES
(1, 1, 'Matemática', 'Equação do 2º Grau', 'Como faço para encontrar as raízes de uma equação do segundo grau?', NULL, NULL, 'Pendente', '2026-09-03 13:28:33'),
(2, 2, 'História', 'Revolução Francesa', 'Quais foram as principais causas da Revolução Francesa?', 'Expliquei as principais causas no vídeo.', 'https://www.youtube.com/', 'Respondida', '2026-09-03 13:28:33'),
(3, 3, 'Biologia', 'Mitocôndria', 'Qual é a função da mitocôndria?', NULL, NULL, 'Pendente', '2026-09-03 13:28:33'),
(4, 4, 'Português', 'Interpretação', 'Como identificar a ideia principal de um texto?', NULL, NULL, 'Pendente', '2026-09-03 13:28:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `disciplina` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professores`
--

INSERT INTO `professores` (`id`, `nome`, `disciplina`) VALUES
(1, 'Carlos Mendes', 'Matemática'),
(2, 'Marcos Oliveira', 'História'),
(3, 'Ana Paula', 'Biologia'),
(4, 'Carla Souza', 'Português'),
(5, 'Ricardo Santos', 'Geografia'),
(6, 'Fernanda Lima', 'Química');

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `disciplina` varchar(100) NOT NULL,
  `tema` varchar(150) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `link` varchar(500) NOT NULL,
  `professor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `videos`
--

INSERT INTO `videos` (`id`, `titulo`, `disciplina`, `tema`, `categoria`, `descricao`, `link`, `professor_id`) VALUES
(1, 'Equação do 2º Grau', 'Matemática', 'Equações', 'Revisão', 'Revisão sobre equações do segundo grau.', 'https://www.youtube.com/', 1),
(2, 'Função do 1º Grau', 'Matemática', 'Funções', 'Aula', 'Introdução às funções do primeiro grau.', 'https://www.youtube.com/', 1),
(3, 'Revolução Francesa', 'História', 'Revolução Francesa', 'Revisão', 'Principais acontecimentos da Revolução Francesa.', 'https://www.youtube.com/', 2),
(4, 'Primeira Guerra Mundial', 'História', 'Guerras Mundiais', 'Aula', 'Resumo sobre a Primeira Guerra Mundial.', 'https://www.youtube.com/', 2),
(5, 'Mitocôndria', 'Biologia', 'Célula', 'Aula', 'Função da mitocôndria nas células.', 'https://www.youtube.com/', 3),
(6, 'Célula Animal', 'Biologia', 'Citologia', 'Revisão', 'Principais estruturas da célula animal.', 'https://www.youtube.com/', 3),
(7, 'Interpretação de Texto', 'Português', 'Interpretação', 'Exercícios', 'Técnicas para interpretação de textos.', 'https://www.youtube.com/', 4),
(8, 'Figuras de Linguagem', 'Português', 'Figuras de Linguagem', 'Revisão', 'Revisão das principais figuras de linguagem.', 'https://www.youtube.com/', 4),
(9, 'Globalização', 'Geografia', 'Globalização', 'Aula', 'Conceitos básicos sobre globalização.', 'https://www.youtube.com/', 5),
(10, 'Industrialização', 'Geografia', 'Indústria', 'Revisão', 'Processo de industrialização.', 'https://www.youtube.com/', 5),
(11, 'Tabela Periódica', 'Química', 'Elementos Químicos', 'Revisão', 'Como interpretar a tabela periódica.', 'https://www.youtube.com/', 6),
(12, 'Ligações Químicas', 'Química', 'Ligações', 'Aula', 'Introdução às ligações químicas.', 'https://www.youtube.com/', 6);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cgm` (`cgm`);

--
-- Índices de tabela `duvidas`
--
ALTER TABLE `duvidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aluno_id` (`aluno_id`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `professor_id` (`professor_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `duvidas`
--
ALTER TABLE `duvidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `duvidas`
--
ALTER TABLE `duvidas`
  ADD CONSTRAINT `duvidas_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`);

--
-- Restrições para tabelas `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
