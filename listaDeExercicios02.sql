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
DELIMITER //
CREATE PROCEDURE sp_AdicionarLivro(
    IN N_Livro_ID INT,
    IN N_Titulo VARCHAR(255),
    IN N_Editora_ID INT,
    IN N_Ano_Publicacao INT,
    IN N_Numero_Paginas INT,
    IN N_Categoria_ID INT
)
BEGIN
    DECLARE livro_existente INT;

    SELECT COUNT(*) INTO livro_existente FROM Livro WHERE Titulo = n_titulo;

    IF livro_existente = 0 THEN
        INSERT INTO Livro (Livro_ID, Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (N_Livro_ID, N_Titulo, N_Editora_ID, N_Ano_Publicacao, N_Numero_Paginas, N_Categoria_ID);
    END IF;

END;
//
DELIMITER ;

CALL sp_AdicionarLivro(13, 'Manual de Redstone do Vinnicius13', 4, 2013, 1300, 1);
SELECT * FROM LIVRO;

--EX08
DELIMITER //

CREATE PROCEDURE EncontrarAutorMaisAntigo()
BEGIN
    SELECT nome, Sobrenome
    FROM Autor
    WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM Autor);
END 
//
DELIMITER ;
CALL EncontrarAutorMaisAntigo();

--EX09
DELIMITER // --Aplica um novo delimitador para indentificar onde começa e termina a Procedure
CREATE PROCEDURE sp_ListarAutores() --Cria a Procedure, determinando o nome dela
BEGIN --Começa a Procedure
	SELECT nome, sobrenome FROM Autor; --Seleciona a coluna de Nome e Sobrenome da tabela Autor
END --Termina a Procedure
// --Delimitador para terminar a Procedure
DELIMITER ; --Aplica o delimitador padrão para continuar o código
CALL sp_ListarAutores(); --Chama a Procedure para ser executada

--EX10
