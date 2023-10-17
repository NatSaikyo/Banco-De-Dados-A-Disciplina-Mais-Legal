--EX01
DELIMITER //
CREATE FUNCTION total_livros_por_genero(nome_genero VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE total INT;
    DECLARE genero_id INT;
    
    SELECT id INTO genero_id FROM Genero WHERE nome_genero = nome_genero;
    
    IF genero_id IS NOT NULL THEN
        SELECT COUNT(*) INTO total FROM Livro WHERE id_genero = genero_id;
        RETURN total;
    ELSE
        RETURN 0;
    END IF;
END //
DELIMITER ;

--EX02
DELIMITER //
CREATE FUNCTION listar_livros_por_autor(primeiro_nome VARCHAR(255), ultimo_nome VARCHAR(255))
RETURNS TEXT
BEGIN
    DECLARE lista_livros TEXT DEFAULT '';
    DECLARE autor_id INT;
    DECLARE livro_titulo VARCHAR(255);
    
    SELECT id INTO autor_id FROM Autor WHERE primeiro_nome = primeiro_nome AND ultimo_nome = ultimo_nome;
    
    IF autor_id IS NOT NULL THEN
        DECLARE cur CURSOR FOR
            SELECT Livro.titulo FROM Livro
            JOIN Livro_Autor ON Livro.id = Livro_Autor.id_livro
            WHERE Livro_Autor.id_autor = autor_id;
            
        OPEN cur;
        FETCH cur INTO livro_titulo;
        
        WHILE FETCH_STATUS = 0 DO
            SET lista_livros = CONCAT(lista_livros, livro_titulo, ', ');
            FETCH cur INTO livro_titulo;
        END WHILE;
        
        CLOSE cur;
        RETURN lista_livros;
    ELSE
        RETURN 'Autor não encontrado.';
    END IF;
END //
DELIMITER ;

