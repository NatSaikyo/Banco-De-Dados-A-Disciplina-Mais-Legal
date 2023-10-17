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
