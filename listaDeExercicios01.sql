--EX01
SELECT titulo FROM livros;

--EX02
SELECT nome FROM autores WHERE nascimento <= '1900-01-01';

--EX03
SELECT  titulo ,autor_id, nome FROM livros l 
JOIN autores a ON a.id = l.autor_id
WHERE a.nome = 'J.K. Rowling';

--EX04
SELECT aluno_id, nome, curso FROM alunos a
LEFT JOIN matriculas m ON m.id  = a.id
WHERE curso = "Engenharia de Software";

--EX05
SELECT produto, sum(receita) AS receita_t
FROM vendas GROUP BY produto;

--EX06
SELECT nome, COUNT(autor_id) AS total_de_livros_autor
FROM livros l JOIN autores a ON a.id = l.autor_id
GROUP BY nome;

--EX07
SELECT curso, COUNT(a.id) AS quantidade_de_alunos
FROM alunos a JOIN matriculas m ON m.id  = a.id
GROUP BY curso;

--EX08
SELECT produto,avg(receita) AS media_por_produto
FROM vendas GROUP BY produto;

--EX09
CREATE VIEW receita_total AS 
SELECT produto, sum(receita) AS receita_t
FROM vendas GROUP BY produto;
SELECT * FROM receita_total
WHERE receita_t >= "10000.00";

--EX10
CREATE VIEW quantidade_de_livros AS
SELECT nome, COUNT(autor_id) AS total_de_livros_autor
FROM livros l JOIN autores a ON a.id = l.autor_id
GROUP BY nome;
SELECT * FROM quantidade_de_livros
WHERE total_de_livros_autor >= 2;

--EX11
CREATE VIEW livros_e_autores AS
SELECT titulo,nome FROM livros l 
JOIN autores a ON a.id = l.autor_id;
SELECT * FROM livros_e_autores;

--EX12
CREATE VIEW aluno_curso AS
SELECT nome, curso FROM alunos a
RIGHT JOIN matriculas m ON m.id  = a.id;
SELECT * FROM aluno_curso;

--EX13
SELECT nome, titulo FROM  autores a
LEFT JOIN  livros l  ON a.id = l.autor_id;

--EX14
SELECT nome, curso FROM alunos a
RIGHT JOIN matriculas m ON m.id  = a.id;

--EX15
SELECT nome, curso FROM alunos a
INNER JOIN matriculas m ON m.id  = a.id;

--EX16
SELECT nome AS nome_autor, COUNT(livros.id) AS quantidade_de_livros
FROM autores LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id ORDER BY quantidade_de_livros 
DESC LIMIT 1;

--EX17
SELECT produto, sum(receita) AS soma_da_receita
FROM vendas GROUP BY produto
HAVING sum(receita) = (
    SELECT min(total_da_receita FROM (
        SELECT produto, sum(receita) AS total_da_receita
        FROM vendas GROUP BY produto 
    ) AS receita_gerada_por_cada_produto
);

--EX19
SELECT alunos.id AS Aluno_ID,alunos.nome 
AS Nome_Aluno,count(matriculas.id) 
AS Numero_de_Matriculas
GROM alunos
LEFT JOIN  matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.id, alunos.nome;

--EX20
SELECT produto, COUNT(produto) AS transacoes
FROM vendas GROUP BY produto
ORDER BY transacoes
DESC LIMIT 1;
