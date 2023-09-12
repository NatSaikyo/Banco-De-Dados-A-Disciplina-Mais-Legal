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
