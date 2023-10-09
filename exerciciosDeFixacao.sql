CREATE DATABASE exerciciodefixacao;
USE exerciciodefixacao;

--EX01
--A)
CREATE TABLE nomes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);
INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

--B)
SELECT UPPER(nome) AS nome_maiusculo FROM nomes;

--C)
SELECT nome, LENGTH(nome) AS tamanho_nome FROM nomes;

--D)
-- Selecionar nomes com tratamento adequado
SELECT 
    CASE 
        WHEN nome LIKE '%Roberto%' OR nome LIKE '%João%' THEN CONCAT('Sr. ', nome)
        WHEN nome LIKE '%Roberta%' OR nome LIKE '%Maria Clara%' THEN CONCAT('Sra. ', nome)
        ELSE nome
    END AS nome_com_tratamento
FROM nomes;

--EX02
--A)
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

--B)
SELECT produto, ROUND(preco, 2) AS preco_arredondado, quantidade
FROM produtos;

--C)
SELECT produto, preco, ABS(quantidade) AS quantidade_absoluta
FROM produtos;

--D)
SELECT AVG(preco) AS media_precos
FROM produtos;

--EX03
--A)
CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_evento DATETIME
);

INSERT INTO eventos (data_evento) VALUES
('2018-10-15 10:10:10'),
('2009-11-02 12:00:00'),
('2000-11-20 11:59:59'),
('1948-12-05 12:28:59'),
('2024-01-10 06:09:00'),
('1900-02-22 08:12:34'),
('2070-03-15 15:15:30'),
('2021-04-08 12:12:12'),
('2020-05-19 23:59:10'),
('2019-06-02 00:00:00'),
('2118-07-14 00:12:00'),
('2006-04-28 02:00:38');

--B)
INSERT INTO eventos (data_evento)
SELECT NOW() as DatAtual;

--C)
SELECT data_evento, data_evento AS data_atual, DATEDIFF(NOW(), data_evento) AS Comparação_total
FROM eventos;

--D)
SELECT DAYNAME(data_evento) AS nome_dia_semana
FROM eventos;

--EX04
--A)
INSERT INTO produtos(produto, preco, quantidade) VALUES
('Batata', '05.00', 10),
('Maçã', '02.00', 0),
('Abacaxi', '08.50', 5);

SELECT produto, preco, quantidade,
       IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

--B)
SELECT produto, preco, quantidade,
    CASE
        WHEN preco <= 3.00 THEN 'Barato'
        WHEN preco <= 6.00 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;
