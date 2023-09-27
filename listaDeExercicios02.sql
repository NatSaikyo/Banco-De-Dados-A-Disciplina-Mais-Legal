--EX01
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
	SELECT nome, sobrenome FROM Autor;
END
//
DELIMITER ;
CALL sp_ListarAutores();

--EX02
DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN p_categoria varchar(100))
BEGIN
	SELECT titulo FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_categoria);
END
//

DELIMITER ;
CALL sp_LivrosPorCategoria("Romance");
CALL sp_LivrosPorCategoria("Autoajuda");
CALL sp_LivrosPorCategoria("Ficção Científica");

--EX03
DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN p_categoria varchar(100))
BEGIN
    SELECT Categoria_ID, COUNT(*) AS quantidadeDeLivros FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_categoria) GROUP BY Categoria_ID;
END
//

DELIMITER ;
CALL sp_LivrosPorCategoria("Romance");

--EX04
DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoria_valor varchar(100), OUT tf_livros varchar(30))
BEGIN
    DECLARE verificar INT;
    WITH Selet_ID as (
        SELECT (select Categoria_ID from categoria where nome = Categoria_valor) as cate_valor
    )


    SELECT COUNT(*) INTO verificar FROM livro INNER JOIN Selet_ID on cate_valor = Categoria_ID;
    IF verificar > 0 THEN
        SET tf_livros = 'Possui Livros';
    ELSE
        SET tf_livros = 'Não Possui Livros';
    END IF;
END;
//
DELIMITER ;
CALL sp_VerificarLivrosCategoria('Ciência', @ver);
SELECT @ver as tem_ou_não;

--EX05
DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN p_lpano INT)
  BEGIN
    SELECT Titulo, Ano_Publicacao FROM Livro
    WHERE Ano_Publicacao <= p_lpano;
	END
//
DELIMITER ;
CALL sp_LivrosAteAno(2004);

--EX06
DELIMITER //
CREATE PROCEDURE categoria_dos_livros (IN p_categoria varchar(100))
BEGIN
    SELECT titulo FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_categoria);
END
//
DELIMITER ;
CALL sp_LivrosPorCategoria("Romance");
CALL sp_LivrosPorCategoria("Autoajuda");
CALL sp_LivrosPorCategoria("Ficção Científica");

--EX07

--EX08

--EX09

--EX10